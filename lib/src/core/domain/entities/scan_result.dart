import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_result.freezed.dart';

@freezed
abstract class ScanResult with _$ScanResult {
  const factory ScanResult({
    @Default("") String name,
    @Default([]) List<String> suggestedTags,
  }) = _ScanResult;
}

@freezed
abstract class ScanResultWithImage with _$ScanResultWithImage {
  const factory ScanResultWithImage({
    required Uint8List imageData,
    @Default("") String name,
    @Default([]) List<String> suggestedTags,
  }) = _ScanResultWithImage;
}

extension ScanResultExtension on ScanResult {
  ScanResultWithImage attachImage(Uint8List imageData) {
    return ScanResultWithImage(
      imageData: imageData,
      name: name,
      suggestedTags: suggestedTags,
    );
  }
}