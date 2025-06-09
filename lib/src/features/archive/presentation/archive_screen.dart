import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  static const String routeName = "/archive";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: const Center(
        child: Text("Archive"),
      ),
    );
  }
}
