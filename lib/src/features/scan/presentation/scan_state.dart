import 'package:flutter/services.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';

sealed class ScanState {
  final Uint8List? imageData;
  const ScanState({this.imageData});
}

class ScanLoading extends ScanState {
  const ScanLoading({super.imageData});
}

class ScanSuccess extends ScanState {
  final List<ScanResult> scanResults;
  const ScanSuccess({
    super.imageData,
    this.scanResults = const [],
  });
}

class ScanError extends ScanState {
  const ScanError({super.imageData});
}
