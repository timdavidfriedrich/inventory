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
              const SizedBox(height: Dimensions.largeSpacing),
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Container(
                  color: Colors.red,
                  child: DeclutterSwipeStack(
                    controller: swipeController,
                    cardCount: state.remainingItems.length,
                    onSwipedLeft: (_) => toss(),
                    onSwipedUp: (_) => move(),
                    onSwipedRight: (_) => keep(),
                    cardBuilder: (context, index) {
                      return DeclutterSwipeCard(
                        item: state.remainingItems[index],
                        onToss: swipeController.swipeLeft,
                        onMove: swipeController.swipeUp,
                        onKeep: swipeController.swipeRight,
                      );
                    },
                  ),
                ),
              ),
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
      leading: IconButton(
        icon: Icon(AppIcons.undo(context)),
        onPressed: () => {},
      ),
      title: Text("${state.currentIndex + 1} / ${state.totalItems}"),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            // TODO: Localize
            "Skip",
            style: TextStyle(color: context.c.onSurface),
          ),
        ),
        const SizedBox(width: Dimensions.extraSmallSpacing),
      ],
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
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          AppIcons.undo(context),
        ),
      ),
      middle: Text("${state.currentIndex + 1} / ${state.totalItems}"),
      trailing: GestureDetector(
        onTap: () => {},
        child: Icon(
          AppIcons.manage(context),
          color: context.c.primary,
          size: Dimensions.semiExtraLargeIconSize,
        ),
      ),
    );
  }
}
