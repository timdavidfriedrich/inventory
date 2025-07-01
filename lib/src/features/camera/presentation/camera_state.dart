import 'dart:typed_data';

import 'package:camera/camera.dart';

sealed class CameraState {
  const CameraState();
}

class CameraLoading extends CameraState {
  const CameraLoading();
}

class CameraReady extends CameraState {
  final CameraController controller;

  const CameraReady(this.controller);
}

class CameraPictureTaken extends CameraState {
  final CameraController controller;
  final Uint8List imageData;
  const CameraPictureTaken(this.controller, this.imageData);
}

class CameraDone extends CameraState {
  final Uint8List imageData;
  const CameraDone(this.imageData);
}

class CameraError extends CameraState {
  final String message;
  const CameraError(this.message);
}
