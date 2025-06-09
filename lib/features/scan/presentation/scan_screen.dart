import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/core/presentation/app_router.dart';
import 'package:inventory/core/presentation/extensions/context_extensions.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  static const String routeName = "/scan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: Center(
        child: FilledButton(
          onPressed: () => DetailsRoute().push(context),
          child: const Text("Scan"),
        ),
      ),
    );
  }
}
