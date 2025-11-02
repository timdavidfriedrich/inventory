import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/features/camera/presentation/camera_event.dart';
import 'package:inventory/src/features/camera/presentation/camera_state.dart';
import 'package:inventory/src/features/camera/presentation/extensions/xfile_extensions.dart';

@injectable
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraLoading()) {
    on<CameraInitialize>(_onCameraInitialized);
    on<CameraFailInitialize>(_onCameraFailInitialize);
    on<CameraTakePicture>(_onCameraTakePicture);
    on<CameraRetry>(_onCameraRetry);
    on<CameraSavePicture>(_onCameraSavePicture);
  }

  void _onCameraInitialized(
    CameraInitialize event,
    Emitter<CameraState> emit,
  ) {
    emit(CameraReady(event.controller));
  }

  void _onCameraFailInitialize(
    CameraFailInitialize event,
    Emitter<CameraState> emit,
  ) {
    emit(CameraError(event.message));
  }

  void _onCameraTakePicture(
    CameraTakePicture event,
    Emitter<CameraState> emit,
  ) async {
    if (state is CameraReady) {
      final controller = (state as CameraReady).controller;
      try {
        final file = await controller.takePicture();
        final croppedFile = await file.cropToSquare();
        final imageData = await croppedFile.readAsBytes();

        await controller.dispose();

        emit(CameraPictureTaken(controller, imageData));
      } catch (error) {
        emit(CameraError(error.toString()));
      }
    } else {
      emit(const CameraError('Camera is not ready'));
    }
  }

  void _onCameraRetry(
    CameraRetry event,
    Emitter<CameraState> emit,
  ) async {
    final controller = event.controller;
    if (controller == null) {
      emit(const CameraError("Retry failed. Camera controller is null"));
      return;
    }

    try {
      await controller.dispose();

      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        emit(const CameraError("No cameras available"));
        return;
      }

      final newController = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await newController.initialize();
      emit(CameraReady(newController));
    } catch (e) {
      emit(CameraError("Failed to reinitialize camera: $e"));
    }
  }

  void _onCameraSavePicture(
    CameraSavePicture event,
    Emitter<CameraState> emit,
  ) {
    emit(CameraDone(event.imageData));
  }
}
