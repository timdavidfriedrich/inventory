import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';
import 'package:inventory/src/core/presentation/app_router.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  static const String routeName = "/scan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: Center(
        child: FilledButton(
          onPressed: () => DetailsFromScanRoute(
            ScanResult(
              suggestedTags: ["Example", "Suggestion"],
              name: "Test name",
            ).attachImage(Uint8List(0)),
          ).push(context),
          child: Text(context.s.screen_scan),
        ),
      ),
    );
  }
}
