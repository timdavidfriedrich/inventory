import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/domain/entities/tab_screen.dart';

class TasksScreen extends StatelessWidget with TabScreen {
  const TasksScreen({super.key});

  @override
  String get tabLabel => "Tasks";
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
        child: Text(tabLabel),
      ),
    );
  }
}
