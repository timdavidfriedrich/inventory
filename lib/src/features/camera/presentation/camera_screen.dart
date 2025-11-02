import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/presentation/error_screen.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/loading_screen.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/core/presentation/widgets/floating_toolbar.dart';
import 'package:inventory/src/core/presentation/widgets/vertical_error_widget.dart';
import 'package:inventory/src/features/camera/presentation/camera_bloc.dart';
import 'package:inventory/src/features/camera/presentation/camera_event.dart';
import 'package:inventory/src/features/camera/presentation/camera_state.dart';
import 'package:inventory/src/features/camera/presentation/hooks/use_camera_controller.dart';

class CameraScreen extends HookWidget {
  static const String routeName = '/camera';
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<CameraBloc>();
    return BlocProvider<CameraBloc>(
      create: (_) => bloc,
      child: _CameraScreenBuilder(),
    );
  }
}

class _CameraScreenBuilder extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CameraBloc>();
    // ? Move camera lifecycle to CameraBloc?
    useCameraController(
      onControllerReady: (controller) {
        bloc.add(CameraInitialize(controller));
      },
      onError: (error) {
        bloc.add(CameraFailInitialize(error.description ?? context.s.error_common));
      },
    );
    return BlocConsumer<CameraBloc, CameraState>(
      listenWhen: (previous, current) => current is CameraDone,
      listener: (context, state) {
        final imageData = (state as CameraDone).imageData;
        context.pop(imageData);
      },
      buildWhen: (previous, current) => current is! CameraDone,
      builder: (context, state) {
        return switch (state) {
          CameraLoading() => const LoadingScreen(),
          CameraReady() => const _CameraScreen(),
          CameraPictureTaken() => const _CameraPictureTakenScreen(),
          CameraError() => const ErrorScreen(),
          CameraDone() => SizedBox.shrink(),
        };
      },
    );
  }
}

class _CameraScreen extends StatelessWidget {
  const _CameraScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.largeSpacing,
        ),
        child: Column(
          children: [
            SizedBox(height: Dimensions.largeSpacing),
            _CameraBox(),
            Spacer(),
            _TakePictureButton(),
            SizedBox(height: Dimensions.ultraLargeSpacing),
          ],
        ),
      ),
    );
  }
}

class _CameraBox extends StatelessWidget {
  const _CameraBox();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CameraBloc>().state as CameraReady;
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.largeBorderRadius),
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: state.controller.value.previewSize?.height ?? 0,
            height: state.controller.value.previewSize?.width ?? 0,
            child: CameraPreview(state.controller),
          ),
        ),
      ),
    );
  }
}

class _TakePictureButton extends StatelessWidget {
  const _TakePictureButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CameraBloc>();
    return FloatingActionButton.large(
      onPressed: () {
        bloc.add(CameraTakePicture());
      },
      child: const Icon(Icons.camera_alt_outlined),
    );
  }
}

class _CameraPictureTakenScreen extends StatelessWidget {
  const _CameraPictureTakenScreen();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final state = context.read<CameraBloc>().state;
        if (state is CameraPictureTaken) {
          context.read<CameraBloc>().add(CameraRetry(state.controller));
        }
      },
      child: Scaffold(
        appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.largeSpacing,
          ),
          child: Column(
            children: [
              SizedBox(height: Dimensions.largeSpacing),
              _PictureBox(),
              Spacer(),
              _PictureActionButtons(),
              SizedBox(height: Dimensions.extraLargeSpacing),
            ],
          ),
        ),
      ),
    );
  }
}

class _PictureBox extends StatelessWidget {
  const _PictureBox();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CameraBloc>().state;
    if (state is! CameraPictureTaken) {
      return const VerticalErrorWidget();
    }
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.largeBorderRadius),
        child: Image.memory(
          state.imageData,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PictureActionButtons extends StatelessWidget {
  const _PictureActionButtons();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CameraBloc>();
    return Row(
      children: [
        FloatingToolbar(
          children: [
            FloatingToolbarButton(
              onPressed: () {
                final state = context.read<CameraBloc>().state;
                if (state is CameraPictureTaken) {
                  bloc.add(CameraRetry(state.controller));
                }
              },
              child: Icon(AppIcons.retry(context)),
            ),
          ],
        ),
        const Spacer(),
        FloatingActionButton(
          onPressed: () {
            final state = context.read<CameraBloc>().state;
            if (state is CameraPictureTaken) {
              bloc.add(CameraSavePicture(state.imageData));
            }
          },
          child: Icon(AppIcons.done(context)),
        ),
      ],
    );
  }
}
