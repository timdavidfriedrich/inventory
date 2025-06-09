import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/tab_screen_mixin.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class TasksScreen extends StatelessWidget with TabScreen {
  const TasksScreen({super.key});

  @override
  String tabLabel(context) => context.s.screen_tasks;
  @override
  Icon get tabIcon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get tabSelectedIcon => const Icon(Icons.fact_check);
  @override
  Icon get tabCupertinoIcon => const Icon(CupertinoIcons.square_list);
  @override
  Icon get tabCupertinoSelectedIcon => const Icon(CupertinoIcons.square_list_fill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.s.screen_tasks),
      ),
    );
  }
}
