import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/scan/data/datasources/image_scan_data_source.dart';
import 'package:inventory/src/features/scan/data/mappers/scan_result_mappers.dart';
import 'package:inventory/src/features/scan/data/models/remote_scan_result.dart';
import 'package:inventory/src/features/scan/data/secrets/gemini_secrets.dart';
import 'package:log/log.dart';
import 'package:mime/mime.dart';

const _objectsFieldName = "objects";
const _nameFieldName = "name";
const _suggestedCategoriesFieldName = "suggestedCategories";
const _confidenceFieldName = "confidence";

@LazySingleton(as: ImageScanDataSource)
class RemoteImageScanDataSourceImpl implements ImageScanDataSource {
  final _apiKey = GeminiSecrets.apiKey;
  // TODO: Move _baseModelsUrl, _modelName and _functionName to a remote config
  final _baseModelsUrl = "https://generativelanguage.googleapis.com/v1beta/models";
  final _modelName = "gemini-2.0-flash-lite";
  final _functionName = "generateContent";

  final _maxTokens = 512;

  @override
  Future<AppResult<List<RemoteScanResult>>> scanImageForSuggetions(
    Uint8List imageData, {
    String? languageName,
  }) async {
    try {
      final url = "$_baseModelsUrl/$_modelName:$_functionName?key=$_apiKey";

      final mimeType = lookupMimeType('', headerBytes: imageData) ?? "image/jpeg";
      final base64Image = base64Encode(imageData);

      final prompt = GeminiSecrets.prompt(languageName ?? "English");

      final requestBody = _buildRequestBody(
        base64Image: base64Image,
        mimeType: mimeType,
        prompt: prompt,
      );

      final inputTokenCount = await _estimateTokens(prompt, imageData: imageData);

      Log.hint("Request image labels using about $inputTokenCount input tokens.\nPrompt:\n$prompt");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode < 200 && response.statusCode > 299) {
        final exception = Exception(response.body);
        Log.error("Error getting labels from image", exception: exception);
        return AppResult.error(exception);
      }

      return _parseResponse(response.body);
    } on Exception catch (e) {
      Log.error("Error getting labels from image", exception: e);
      return AppResult.error(e);
    }
  }

  Map<String, dynamic> _buildRequestBody({
    required String base64Image,
    required String mimeType,
    required String prompt,
  }) {
    return {
      "contents": [
        {
          "parts": [
            {
              "inlineData": {
                "mimeType": mimeType,
                "data": base64Image,
              }
            },
            {"text": prompt},
          ]
        }
      ],
      "generationConfig": {
        "maxOutputTokens": _maxTokens,
        "responseMimeType": "application/json",
        "responseSchema": {
          "type": "object",
          "properties": {
            _objectsFieldName: {
              "type": "array",
              "items": {
                "type": "object",
                "properties": {
                  _nameFieldName: {"type": "string"},
                  _suggestedCategoriesFieldName: {
                    "type": "array",
                    "items": {"type": "String"}
                  },
                  _confidenceFieldName: {"type": "number"}
                },
                "required": [
                  _nameFieldName,
                  _suggestedCategoriesFieldName,
                  _confidenceFieldName,
                ]
              }
            }
          },
          "required": [_objectsFieldName]
        }
      }
    };
  }

  AppResult<List<RemoteScanResult>> _parseResponse(String responseBody) {
    final jsonResponse = jsonDecode(responseBody);
    final List? candidates = jsonResponse["candidates"];

    if (candidates == null || candidates.isEmpty) {
      Log.warning("No candidates found in response. Response:\n$responseBody");
      return AppResult.error(Exception("No candidates found"));
    }

    final content = candidates.first["content"];
    final List? parts = content["parts"];

    if (parts == null || parts.isEmpty) {
      Log.warning("No parts found in response.");
      return AppResult.error(Exception("No parts found"));
    }

    final outputText = parts.first["text"];

    _estimateTokens(outputText).then((estimatedTokens) {
      Log.hint(
          "Received image labels using about $estimatedTokens output tokens.\nResponse:\n$outputText");
    });

    final jsonString = _extractJsonString(outputText);
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>?;

    final results = jsonMap?.toRemoteScanResults();

    if (results == null) {
      Log.warning("No valid remote scan results found in response. Response:\n$jsonString");
      return AppResult.error(Exception("No valid remote scan results found"));
    }

    return AppResult.success(results);
  }

  String _extractJsonString(String rawResponse) {
    final startIndex = rawResponse.indexOf("{");
    final endIndex = rawResponse.lastIndexOf("}");
    return rawResponse.substring(startIndex, endIndex + 1);
  }

  Future<int> _estimateTokens(
    String prompt, {
    Uint8List? imageData,
  }) async {
    final int textTokens = (prompt.length / 4).ceil();
    final int bufferedText = (textTokens * 1.1).ceil();

    int imageTokens = 0;
    if (imageData != null) {
      Image decoded = await decodeImageFromListAsync(imageData);
      final int width = decoded.width;
      final int height = decoded.height;

      // Determine tile count based on Gemini rules:
      // If both ≤ 384px => 1 tile (258 tokens), else
      // tiles_w = ceil(w / 768), tiles_h = ceil(h / 768)
      int tiles;
      if (width <= 384 && height <= 384) {
        tiles = 1;
      } else {
        final int tilesW = ((width + 767) ~/ 768);
        final int tilesH = ((height + 767) ~/ 768);
        tiles = tilesW * tilesH;
      }
      imageTokens = tiles * 258;
    }

    return bufferedText + imageTokens;
  }

  Future<Image> decodeImageFromListAsync(Uint8List bytes) {
    final Completer<Image> completer = Completer<Image>();
    decodeImageFromList(bytes, (Image img) {
      completer.complete(img);
    });
    return completer.future;
  }
}
