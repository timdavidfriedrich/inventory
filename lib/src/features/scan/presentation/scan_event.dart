import 'package:flutter/foundation.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';

sealed class ScanEvent {
  const ScanEvent();
}

class ScanGetSuggestions extends ScanEvent {
  final Uint8List imageData;
  final String? languageName;
  const ScanGetSuggestions(this.imageData, {this.languageName});
}

class ScanSelectSuggestedName extends ScanEvent {
  final ScanResult scanResult;
  final void Function(ScanResult scanResult)? onScanResultSelected;
  const ScanSelectSuggestedName({
    required this.scanResult,
    this.onScanResultSelected,
  });
}

class ScanCancel extends ScanEvent {
  final VoidCallback? onCancel;
  const ScanCancel({this.onCancel});
}
