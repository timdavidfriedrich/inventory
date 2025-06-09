import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/domain/entities/tab_screen.dart';

class DeclutterScreen extends StatelessWidget with TabScreen {
  const DeclutterScreen({super.key});

  @override
  String get tabLabel => "Declutter";
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(tabLabel),
      ),
    );
  }
}
