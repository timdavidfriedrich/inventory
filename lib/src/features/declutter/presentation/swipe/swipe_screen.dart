import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/presentation/error_screen.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/loading_screen.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_bloc.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_event.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_state.dart';
import 'package:inventory/src/features/declutter/presentation/widgets/declutter_card.dart';
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

class _DeclutterSwipeScreen extends StatelessWidget {
  const _DeclutterSwipeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? const _CupertinoAppBar() : const _MaterialAppBar(),
      body: const _DeclutterCardStack(),
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

class _DeclutterCardStack extends StatefulWidget {
  const _DeclutterCardStack();

  @override
  State<_DeclutterCardStack> createState() => _DeclutterCardStackState();
}

class _DeclutterCardStackState extends State<_DeclutterCardStack> {
  double _dragProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SwipeBloc>().state;
    if (state is! SwipeItemLoadSuccess) {
      return const SizedBox.shrink();
    }

    // TOOD: Add card stack instead of only 1 card
    // if (items.isEmpty) {
    //   return const Center(
    //     child: Text("All done!"),
    //   );
    // }

    final topItem = state.item; //items.first;
    final nextItem = null; //items.length > 1 ? items[1] : null;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.largeSpacing,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                if (nextItem != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: DeclutterCard(
                        item: nextItem,
                        isTopCard: false,
                        dragProgress: _dragProgress,
                        onSwipeLeft: () {},
                        onSwipeRight: () {},
                        onSwipeUp: () {},
                        onDragUpdate: (progress) {},
                      ),
                    ),
                  ),
                Positioned(
                  top: Dimensions.extraLargeSpacing,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: DeclutterCard(
                      item: topItem,
                      isTopCard: true,
                      dragProgress: _dragProgress,
                      onSwipeLeft: () {
                        final itemId = topItem.id;
                        if (itemId == null) return;
                        context.read<SwipeBloc>().add(SwipeItemActioned(itemId, SwipeAction.toss));
                      },
                      onSwipeRight: () {
                        final itemId = topItem.id;
                        if (itemId == null) return;
                        context.read<SwipeBloc>().add(SwipeItemActioned(itemId, SwipeAction.keep));
                      },
                      onSwipeUp: () {
                        final itemId = topItem.id;
                        if (itemId == null) return;
                        context.read<SwipeBloc>().add(SwipeItemActioned(itemId, SwipeAction.move));
                      },
                      onDragUpdate: (progress) {
                        setState(() {
                          _dragProgress = progress;
                        });
                        Log.debug("Drag progress: $progress");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
