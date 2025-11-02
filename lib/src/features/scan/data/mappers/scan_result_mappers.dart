import 'package:inventory/src/features/scan/data/models/remote_scan_result.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';

extension RemoteScanResultJsonMappers on Map<String, dynamic> {
  List<RemoteScanResult> toRemoteScanResults() {
    final objects = this["objects"] as List<dynamic>?;
    if (objects == null || objects.isEmpty) {
      return [];
    }
    return objects.map((object) {
      if (object is Map<String, dynamic>) {
        return object._toRemoteScanResult();
      } else {
        throw Exception("Invalid object format: $object");
      }
    }).toList();
  }

  RemoteScanResult _toRemoteScanResult() {
    return RemoteScanResult(
      name: this["name"] as String,
      suggestedCategories: (this["suggestedCategories"] as List<dynamic>).map((e) {
        return e as String;
      }).toList(),
      confidence: (this["confidence"] as num).toDouble(),
    );
  }
}

extension RemoteScanResultMappers on RemoteScanResult {
  ScanResult toScanResult() {
    return ScanResult(
      name: name,
      suggestedTags: suggestedCategories,
    );
  }
}
