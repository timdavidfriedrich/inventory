import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class AddTagDialog extends HookWidget {
  const AddTagDialog({super.key});

  static Future<String?> show(BuildContext context) {
    return showDialog<String?>(
      context: context,
      builder: (context) => const AddTagDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    return AlertDialog.adaptive(
      title: Text(context.s.details_add_tag),
      content: TextField(
        controller: textController,
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(context.s.common_cancel),
        ),
        FilledButton(
          onPressed: () => context.pop(textController.value.text.trim()),
          child: Text(context.s.common_add),
        ),
      ],
    );
  }
}
