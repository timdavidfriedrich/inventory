import 'dart:typed_data';

import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/scan/data/datasources/image_scan_data_source.dart';
import 'package:inventory/src/features/scan/data/models/remote_scan_result.dart';

const _dummyScanResults = <RemoteScanResult>[
  RemoteScanResult(
    name: "Laptop",
    suggestedCategories: ['Electronics', 'Computers', 'Office', 'Work'],
  ),
  RemoteScanResult(
    name: "Smartphone",
    suggestedCategories: ['Electronics', 'Mobile Devices', 'Daily Use', 'Gadgets'],
  ),
  RemoteScanResult(
    name: "Headphones",
    suggestedCategories: ['Electronics', 'Audio Equipment', 'Accessories', 'Music', 'Daily Use'],
  ),
];

// * Uncomment the below annotation to enable this dummy data source
// * Keep in mind, that you need to comment out the real implementation data source
//@LazySingleton(as: ImageScanDataSource)
class DummyImageScanDataSourceImpl implements ImageScanDataSource {
  @override
  Future<AppResult<List<RemoteScanResult>>> scanImageForSuggetions(
    Uint8List imageData, {
    String? languageName,
  }) async {
    return AppResult.success(_dummyScanResults);
  }
}
