import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class ArchiveItemConfirmDialog extends HookWidget {
  const ArchiveItemConfirmDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ArchiveItemConfirmDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(context.s.common_archive),
      // TODO: Add item preview to ArchiveItemConfirmDialog
      content: Text(context.s.common_archive_confirm),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(context.s.common_cancel),
        ),
        FilledButton(
          onPressed: () => context.pop(true),
          style: FilledButton.styleFrom(
            backgroundColor: context.c.error,
            foregroundColor: context.c.onError,
          ),
          child: Text(context.s.common_archive),
        ),
      ],
    );
  }
}
