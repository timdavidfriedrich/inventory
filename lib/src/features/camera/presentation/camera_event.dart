import 'dart:typed_data';

import 'package:camera/camera.dart';

sealed class CameraEvent {
  const CameraEvent();
}

class CameraInitialize extends CameraEvent {
  final CameraController controller;
  const CameraInitialize(this.controller);
}

class CameraFailInitialize extends CameraEvent {
  final String message;
  const CameraFailInitialize(this.message);
}

class CameraTakePicture extends CameraEvent {
  const CameraTakePicture();
}

class CameraRetry extends CameraEvent {
  final CameraController? controller;
  const CameraRetry(this.controller);
}

class CameraSavePicture extends CameraEvent {
  final Uint8List imageData;
  const CameraSavePicture(this.imageData);
}
