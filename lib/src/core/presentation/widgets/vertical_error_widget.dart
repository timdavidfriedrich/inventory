import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/dimensions.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class VerticalErrorWidget extends StatelessWidget {
  const VerticalErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          context.isIos ? CupertinoIcons.exclamationmark_triangle : Icons.warning_amber_rounded,
          size: Dimensions.extraLargeIconSize,
          color: context.c.primary,
        ),
        const SizedBox(height: Dimensions.mediumSpacing),
        Text(
          context.s.error_general,
          textAlign: TextAlign.center,
          style: context.t.bodyLarge,
        ),
      ],
    );
  }
}
