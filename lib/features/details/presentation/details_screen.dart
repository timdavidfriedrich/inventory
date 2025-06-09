import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/core/presentation/app_router.dart';
import 'package:inventory/core/presentation/extensions/context_extensions.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: const Center(
        child: Text("Details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(HomeRoute().location),
        child: const Icon(Icons.save),
      ),
    );
  }
}
