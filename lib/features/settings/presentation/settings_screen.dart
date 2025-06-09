import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/core/presentation/extensions/context_extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
