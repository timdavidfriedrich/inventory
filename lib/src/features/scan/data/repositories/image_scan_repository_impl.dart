import 'dart:math';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';
import 'package:inventory/src/features/scan/data/datasources/image_scan_data_source.dart';
import 'package:inventory/src/features/scan/data/mappers/scan_result_mappers.dart';
import 'package:inventory/src/features/scan/data/models/remote_scan_result.dart';
import 'package:inventory/src/features/scan/domain/repositories/image_scan_repository.dart';

@LazySingleton(as: ImageScanRepository)
class ImageScanRepositoryImpl implements ImageScanRepository {
  final ImageScanDataSource imageScanDataSource;
  const ImageScanRepositoryImpl({
    required this.imageScanDataSource,
  });

  @override
  Future<AppResult<List<ScanResult>>> scanImageForSuggestions(
    Uint8List imageData, {
    String? languageName = "en",
  }) {
    return imageScanDataSource.scanImageForSuggetions(imageData, languageName: languageName).then(
      (AppResult results) {
        return switch (results) {
          Error() => AppResult.error(results.error),
          Success<List<RemoteScanResult>> remoteResults => AppResult.success(
              remoteResults.value.map((e) => e.toScanResult()).toList(),
            ),
          _ => AppResult.error(Exception("Unexpected result type: $results")),
        };
      },
    );
  }
}
