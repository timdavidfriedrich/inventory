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
      await controller.takePicture().then((XFile file) async {
        final croppedFile = await file.cropToSquare();
        final imageData = await croppedFile.readAsBytes();
        emit(CameraPictureTaken(controller, imageData));
      }).catchError((error) {
        emit(CameraError(error.toString()));
      });
    } else {
      emit(const CameraError('Camera is not ready'));
    }
  }

  void _onCameraRetry(
    CameraRetry event,
    Emitter<CameraState> emit,
  ) {
    final controller = event.controller;
    if (controller == null) {
      emit(const CameraError("Retry failed. Camera controller is null"));
      return;
    }
    emit(CameraReady(controller));
  }

  void _onCameraSavePicture(
    CameraSavePicture event,
    Emitter<CameraState> emit,
  ) {
    emit(CameraDone(event.imageData));
  }
}
