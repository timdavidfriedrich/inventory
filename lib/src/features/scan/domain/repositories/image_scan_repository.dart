import 'dart:typed_data';

import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';

abstract interface class ImageScanRepository {
  Future<AppResult<List<ScanResult>>> scanImageForSuggestions(
    Uint8List imageData, {
    String? languageName = "en",
  });
}
