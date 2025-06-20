import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/presentation/tab_screen_mixin.dart';
import 'package:inventory/src/core/presentation/app_router.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/widgets/vertical_error_widget.dart';
import 'package:inventory/src/features/overview/presentation/overview_bloc.dart';
import 'package:inventory/src/features/overview/presentation/overview_state.dart';

class OverviewScreen extends StatelessWidget with TabScreen {
  const OverviewScreen({super.key});

  @override
  String tabLabel(context) => context.s.screen_overview;
  @override
  Icon get tabIcon => const Icon(Icons.inventory_2_outlined);
  @override
  Icon get tabSelectedIcon => const Icon(Icons.inventory_2);
  @override
  Icon get tabCupertinoIcon => const Icon(CupertinoIcons.cube_box);
  @override
  Icon get tabCupertinoSelectedIcon => const Icon(CupertinoIcons.cube_box_fill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? const _CupertinoAppBar() : const _MaterialAppBar(),
      body: BlocProvider<OverviewBloc>(
        create: (_) => sl<OverviewBloc>(),
        child: BlocBuilder<OverviewBloc, OverviewState>(
          builder: (context, state) {
            return switch (state) {
              OverviewLoading() => const Center(child: CircularProgressIndicator.adaptive()),
              OverviewError() => Center(child: const VerticalErrorWidget()),
              OverviewSuccess(:var items) => ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: item.notes != null ? Text(item.notes!) : null,
                      leading: item.image != null
                          ? Image.memory(item.image!)
                          : const Icon(Icons.image_not_supported_outlined),
                      onTap: () => DetailsRoute(id: item.id).push(context),
                    );
                  },
                ),
            };
          },
        ),
      ),
      floatingActionButton: context.isIos
          ? null
          : FloatingActionButton(
              onPressed: () => ScanRoute().push(context),
              child: const Icon(Icons.add),
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
        icon: const Icon(Icons.settings_outlined),
        onPressed: () => SettingsRoute().push(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.archive_outlined),
          onPressed: () => ArchiveRoute().push(context),
        ),
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
    void openCupertinoMenu() {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (_) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                context.pop();
                SettingsRoute().push(context);
              },
              child: Text(context.s.screen_settings),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                context.pop();
                ArchiveRoute().push(context);
              },
              child: Text(context.s.screen_archive),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            isDefaultAction: true,
            child: Text(context.s.common_cancel),
          ),
        ),
      );
    }

    return CupertinoNavigationBar(
      leading: GestureDetector(
        onTap: openCupertinoMenu,
        child: Icon(
          CupertinoIcons.ellipsis_vertical_circle,
        ),
      ),
      trailing: GestureDetector(
        onTap: () => ScanRoute().push(context),
        child: Icon(
          CupertinoIcons.plus_rectangle_fill,
          color: context.c.primary,
          size: Dimensions.semiExtraLargeIconSize,
        ),
      ),
    );
  }
}
