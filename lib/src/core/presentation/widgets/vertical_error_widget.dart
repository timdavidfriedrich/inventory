import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class VerticalErrorWidget extends StatelessWidget {
  final String? message;
  const VerticalErrorWidget({
    this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          AppIcons.error(context),
          size: Dimensions.extraLargeIconSize,
          color: context.c.primary,
        ),
        const SizedBox(height: Dimensions.mediumSpacing),
        Text(
          message ?? context.s.common_error,
          textAlign: TextAlign.center,
          style: context.t.bodyLarge,
        ),
      ],
    );
  }
}
