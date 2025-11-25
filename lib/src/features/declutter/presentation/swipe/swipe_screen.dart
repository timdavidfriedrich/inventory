import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/config/theme/shapes/expressive_shapes.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/presentation/error_screen.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/loading_screen.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/hooks/use_declutter_swipe_controller.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_bloc.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_event.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_state.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_card.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/declutter_swipe_stack.dart';
import 'package:log/log.dart';

class DeclutterSwipeScreen extends StatelessWidget {
  final int? sessionId;

  const DeclutterSwipeScreen({
    required this.sessionId,
    super.key,
  });

  static const String routeName = "/declutter/swipe";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SwipeBloc>(param1: sessionId)..add(const SwipeCurrentItemRequested()),
      child: BlocConsumer<SwipeBloc, SwipeState>(
        listener: (context, state) {
          if (state is SwipeSessionFinished) {
            // TODO: Show session finished screen on SwipeSessionFinished
            // TODO: Delete the session on button press of that finish screen
            context.read<SwipeBloc>().add(const SwipeDeleteSession());
            context.pop();
          }
        },
        builder: (context, state) {
          return switch (state) {
            SwipeInitial() || SwipeLoading() => const LoadingScreen(),
            SwipeItemLoadSuccess() => const _DeclutterSwipeScreen(),
            SwipeError(:var message) => ErrorScreen(message: message),
            SwipeSessionFinished() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _DeclutterSwipeScreen extends HookWidget {
  const _DeclutterSwipeScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SwipeBloc>().state;
    if (state is! SwipeItemLoadSuccess) {
      Log.error("DeclutterSwipeScreen built in invalid state: $state");
      return const SizedBox.shrink();
    }
    final item = state.currentItem;

    void toss() => context.read<SwipeBloc>().add(SwipeItemActioned(item.id, SwipeAction.toss));
    void move() => context.read<SwipeBloc>().add(SwipeItemActioned(item.id, SwipeAction.move));
    void keep() => context.read<SwipeBloc>().add(SwipeItemActioned(item.id, SwipeAction.keep));

    final swipeController = useDeclutterSwipeController();
    return Scaffold(
      appBar: context.isIos ? const _CupertinoAppBar() : const _MaterialAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.largeSpacing,
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: Dimensions.mediumSpacing),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.c.primaryContainer,
                    borderRadius: BorderRadius.circular(Dimensions.mediumBorderRadius),
                  ),
                  child: DeclutterSwipeStack(
                    initialIndex: state.currentIndex,
                    controller: swipeController,
                    cardCount: state.items.length,
                    onSwipedLeft: (_) => toss(),
                    onSwipedUp: (_) => move(),
                    onSwipedRight: (_) => keep(),
                    cardBuilder: (context, index) {
                      return DeclutterSwipeCard(
                        item: state.items[index],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.largeSpacing),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.largeSpacing,
                ),
                child: _DeclutterActionButtons(
                  onToss: swipeController.swipeLeft,
                  onMove: swipeController.swipeUp,
                  onKeep: swipeController.swipeRight,
                ),
              ),
              const SizedBox(height: Dimensions.mediumSpacing),
              const _DeclutterControlButtons(),
              const SizedBox(height: Dimensions.extraExtraLargeSpacing),
            ],
          ),
        ),
      ),
    );
  }
}

class _MaterialAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MaterialAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SwipeBloc>().state;
    if (state is! SwipeItemLoadSuccess) {
      return AppBar();
    }
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const SizedBox(width: Dimensions.mediumSpacing),
          IconButton(
            onPressed: context.pop,
            icon: Icon(AppIcons.close(context)),
          ),
          const SizedBox(width: Dimensions.mediumSpacing),
          Expanded(
            child: LinearProgressIndicator(
              value: (state.currentIndex + 1) / state.totalItems,
              backgroundColor: context.c.secondaryContainer,
              minHeight: Dimensions.semiSmallSpacing,
              borderRadius: BorderRadius.circular(Dimensions.fullBorderRadius),
              color: context.c.primary,
            ),
          ),
          const SizedBox(width: Dimensions.largeSpacing),
          Text(
            "${state.currentIndex + 1}/${state.totalItems}",
            style: context.t.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: Dimensions.largeSpacing),
        ],
      ),
      centerTitle: true,
    );
  }
}

class _CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CupertinoAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SwipeBloc>().state;
    if (state is! SwipeItemLoadSuccess) {
      return CupertinoNavigationBar();
    }
    return CupertinoNavigationBar(
      middle: Row(children: [
        Expanded(
          child: LinearProgressIndicator(
            value: (state.currentIndex + 1) / state.totalItems,
            backgroundColor: context.c.secondaryContainer,
            minHeight: Dimensions.semiSmallSpacing,
            borderRadius: BorderRadius.circular(Dimensions.fullBorderRadius),
            color: context.c.primary,
          ),
        ),
        const SizedBox(width: Dimensions.largeSpacing),
        Text(
          "${state.currentIndex + 1}/${state.totalItems}",
          style: context.t.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}

enum _ShapeRotation {
  left(-90.0),
  none(0.0),
  right(90.0);

  const _ShapeRotation(this.degrees);
  final double degrees;
  // * pi/180 precalculated
  double get radians => degrees * 0.017453292519943295;
}

class _DeclutterActionButtons extends StatelessWidget {
  final VoidCallback onToss;
  final VoidCallback onMove;
  final VoidCallback onKeep;

  const _DeclutterActionButtons({
    required this.onToss,
    required this.onMove,
    required this.onKeep,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const numberOfButtons = 3;
        const gap = Dimensions.mediumSpacing;

        final availableWidth = constraints.maxWidth;
        final spacing = gap * (numberOfButtons - 1);
        final buttonWidth = (availableWidth - spacing) / numberOfButtons;
        final buttonHeight = buttonWidth;

        return SizedBox(
          height: buttonHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _ActionButton(
                  // TODO: Localize with context.s.declutter_toss
                  label: "Toss",
                  // TODO: Replace arrow icon with AppIcons
                  icon: Icons.arrow_back,
                  rotation: _ShapeRotation.left,
                  onPressed: onToss,
                ),
              ),
              const SizedBox(width: gap),
              Expanded(
                child: _ActionButton(
                  // TODO: Localize with context.s.declutter_move
                  label: "Move",
                  // TODO: Replace arrow icon with AppIcons
                  icon: Icons.arrow_upward,
                  rotation: _ShapeRotation.none,
                  isPrimary: false,
                  onPressed: onMove,
                ),
              ),
              const SizedBox(width: gap),
              Expanded(
                child: _ActionButton(
                  // TODO: Localize with context.s.declutter_keep
                  label: "Keep",
                  // TODO: Replace arrow icon with AppIcons
                  icon: Icons.arrow_forward,
                  rotation: _ShapeRotation.right,
                  onPressed: onKeep,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final _ShapeRotation rotation;
  final bool isPrimary;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.rotation,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isPrimary ? context.c.primary : context.c.secondary;
    final foregroundColor = isPrimary ? context.c.onPrimary : context.c.onSecondary;

    return Transform.rotate(
      angle: rotation.radians,
      child: AspectRatio(
        aspectRatio: 1,
        child: Material(
          color: backgroundColor,
          shape: ExpressiveShapes.ghostish,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onPressed,
            child: Transform.rotate(
              // * Counter-rotate children to default
              angle: -rotation.radians,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.smallSpacing),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: Dimensions.largeIconSize,
                      color: foregroundColor,
                    ),
                    const SizedBox(height: Dimensions.extraSmallSpacing),
                    Text(
                      label,
                      style: context.t.labelMedium?.copyWith(color: foregroundColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeclutterControlButtons extends StatelessWidget {
  const _DeclutterControlButtons();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SwipeBloc>().state;
    if (state is! SwipeItemLoadSuccess) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.canUndo)
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              foregroundColor: context.c.onSurface,
              backgroundColor: context.c.surfaceContainer,
            ),
            // TODO: Localize
            child: const Text("Undo"),
          ),
        if (state.canUndo) const SizedBox(width: Dimensions.smallSpacing),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            foregroundColor: context.c.onSurface,
            backgroundColor: context.c.surfaceContainer,
          ),
          // TODO: Localize
          child: const Text("Skip"),
        ),
      ],
    );
  }
}
