import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/declutter_swipe_stack.dart';

DeclutterSwipeController useDeclutterSwipeController({
  void Function()? onControllerChanged,
}) {
  final controller = useMemoized(() => DeclutterSwipeController());

  useEffect(() {
    void listener() {
      onControllerChanged?.call();
    }

    controller.addListener(listener);

    return () {
      controller.removeListener(listener);
      controller.dispose();
    };
  }, [controller]);

  return controller;
}
