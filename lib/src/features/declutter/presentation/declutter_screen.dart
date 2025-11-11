import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/presentation/tab_screen_mixin.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/features/declutter/presentation/declutter_bloc.dart';
import 'package:inventory/src/features/declutter/presentation/declutter_event.dart';
import 'package:inventory/src/features/declutter/presentation/declutter_state.dart';
import 'package:inventory/src/features/declutter/presentation/widgets/declutter_card.dart';
import 'package:log/log.dart';

class DeclutterScreen extends StatefulWidget with TabScreen {
  const DeclutterScreen({super.key});

  @override
  String tabLabel(context) => context.s.screen_declutter;
  @override
  Icon get tabIcon => const Icon(Icons.cleaning_services_outlined);
  @override
  Icon get tabSelectedIcon => const Icon(Icons.cleaning_services);
  @override
  Icon get tabCupertinoIcon => const Icon(CupertinoIcons.rectangle_on_rectangle_angled);
  @override
  Icon get tabCupertinoSelectedIcon =>
      const Icon(CupertinoIcons.rectangle_fill_on_rectangle_angled_fill);

  @override
  State<DeclutterScreen> createState() => _DeclutterScreenState();
}

class _DeclutterScreenState extends State<DeclutterScreen> {
  double _dragProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? const _CupertinoAppBar() : const _MaterialAppBar(),
      body: BlocProvider<DeclutterBloc>(
        create: (_) => sl<DeclutterBloc>()..add(DeclutterSubscriptionRequested()),
        child: BlocBuilder<DeclutterBloc, DeclutterState>(
          builder: (context, state) {
            return switch (state) {
              DeclutterInitial() => const Center(child: Text("Initial State")),
              DeclutterLoading() => const Center(child: CircularProgressIndicator.adaptive()),
              DeclutterSuccess(:var items) => _buildCardStack(context, items),
              DeclutterError() => const Center(child: Text("Error")),
            };
          },
        ),
      ),
    );
  }

  Widget _buildCardStack(BuildContext context, List<Item> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text("All done!"),
      );
    }

    final topItem = items.first;
    final nextItem = items.length > 1 ? items[1] : null;

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
                      dragProgress: 0.0,
                      onSwipeLeft: () {
                        context.read<DeclutterBloc>().add(DeclutterToss(item: topItem));
                      },
                      onSwipeRight: () {
                        context.read<DeclutterBloc>().add(DeclutterKeep(item: topItem));
                      },
                      onSwipeUp: () {
                        context.read<DeclutterBloc>().add(DeclutterMove(item: topItem));
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

class _MaterialAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MaterialAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(AppIcons.undo(context)),
        onPressed: () => {},
      ),
      title: Text(context.s.screen_declutter),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          // TODO: Localize
          child: Text(
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
    return CupertinoNavigationBar(
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          AppIcons.undo(context),
        ),
      ),
      middle: Text(context.s.screen_declutter),
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
