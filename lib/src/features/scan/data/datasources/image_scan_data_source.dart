import 'dart:typed_data';

import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/scan/data/models/remote_scan_result.dart';

abstract interface class ImageScanDataSource {
  Future<AppResult<List<RemoteScanResult>>> scanImageForSuggetions(
    Uint8List imageData, {
    String? languageName = "en",
  });
}
