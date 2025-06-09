import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/core/domain/entities/tab_screen.dart';
import 'package:inventory/core/presentation/app_router.dart';
import 'package:inventory/core/presentation/extensions/context_extensions.dart';

class OverviewScreen extends StatelessWidget with TabScreen {
  const OverviewScreen({super.key});

  @override
  String get tabLabel => "Overview";
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
      body: Center(
        child: Text(tabLabel),
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
              // TODO: Localize
              child: const Text("Settings"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                context.pop();
                ArchiveRoute().push(context);
              },
              // TODO: Localize
              child: const Text("Archive"),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            isDefaultAction: true,
            // TODO: Localize
            child: Text("Cancel"),
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
          color: Theme.of(context).colorScheme.primary,
          // TODO: Replace with dimension
          size: 36.0,
        ),
      ),
    );
  }
}
