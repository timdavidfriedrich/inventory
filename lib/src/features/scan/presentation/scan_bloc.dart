import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/scan/domain/repositories/image_scan_repository.dart';
import 'package:inventory/src/features/scan/presentation/scan_event.dart';
import 'package:inventory/src/features/scan/presentation/scan_state.dart';

@injectable
class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final ImageScanRepository imageScanRepository;

  ScanBloc(this.imageScanRepository) : super(ScanLoading()) {
    on<ScanGetSuggestions>(_onScanGetSuggestions);
    on<ScanSelectSuggestedName>(_onScanSelectSuggestedName);
    on<ScanCancel>(_onScanCancel);
  }

  void _onScanGetSuggestions(ScanGetSuggestions event, Emitter<ScanState> emit) async {
    final results = await imageScanRepository.scanImageForSuggestions(
      event.imageData,
      languageName: event.languageName,
    );
    emit(switch (results) {
      Success(:var value) => ScanSuccess(imageData: event.imageData, scanResults: value),
      Empty() => ScanSuccess(imageData: event.imageData, scanResults: []),
      Error() => ScanError(imageData: event.imageData),
    });
  }

  void _onScanSelectSuggestedName(ScanSelectSuggestedName event, Emitter<ScanState> emit) {
    event.onScanResultSelected?.call(event.scanResult);
  }

  void _onScanCancel(ScanCancel event, Emitter<ScanState> emit) {
    event.onCancel?.call();
  }
}
