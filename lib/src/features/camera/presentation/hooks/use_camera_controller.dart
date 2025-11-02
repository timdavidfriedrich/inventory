import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:camera/camera.dart';

CameraController? useCameraController({
  ResolutionPreset resolution = ResolutionPreset.high,
  void Function(CameraController controller)? onControllerReady,
  void Function(CameraException error)? onError,
}) {
  final controllerState = useState<CameraController?>(null);

  useEffect(() {
    bool isMounted = true;

    Future<void> init() async {
      try {
        final cameras = await availableCameras();
        if (!isMounted || cameras.isEmpty) return;

        final controller = CameraController(
          cameras.first,
          resolution,
          enableAudio: false,
        );
        await controller.initialize();

        if (!isMounted) {
          controller.dispose();
          return;
        }

        controllerState.value = controller;
        onControllerReady?.call(controller);
      } on CameraException catch (e) {
        if (isMounted) onError?.call(e);
      }
    }

    init();

    return () {
      isMounted = false;
      controllerState.value?.dispose();
    };
  }, const []);

  return controllerState.value;
}
