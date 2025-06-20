import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/dimensions.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/widgets/vertical_error_widget.dart';

const _cancelButtonDelay = Duration(seconds: 3);
const _animationDuration = Duration(seconds: 1);

class ErrorScreen extends StatefulWidget {
  final VoidCallback? onCancel;
  const ErrorScreen({this.onCancel, super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  bool showCancelButton = false;

  @override
  void initState() {
    super.initState();

    if (widget.onCancel != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(_cancelButtonDelay);
        if (mounted) setState(() => showCancelButton = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: Dimensions.extraExtraLargeSpacing),
            const Spacer(),
            const VerticalErrorWidget(),
            const Spacer(),
            AnimatedOpacity(
              opacity: showCancelButton ? 1 : 0,
              duration: _animationDuration,
              child: FilledButton(
                onPressed: widget.onCancel,
                child: Text(context.s.common_cancel),
              ),
            ),
            const SizedBox(height: Dimensions.extraExtraLargeSpacing),
          ],
        ),
      ),
    );
  }
}
