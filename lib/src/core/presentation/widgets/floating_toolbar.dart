import 'package:flutter/material.dart';

class FloatingToolbar extends StatelessWidget {
  final List<FloatingToolbarItem> children;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const FloatingToolbar({
    required this.children,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 4.0,
    this.borderRadius,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Color effectiveBackgroundColor = backgroundColor ?? colorScheme.surfaceContainerHigh;
    final Color effectiveForegroundColor = foregroundColor ?? colorScheme.onSurfaceVariant;

    return Theme(
      data: theme.copyWith(
        colorScheme: colorScheme.copyWith(
          surfaceContainerHigh: effectiveBackgroundColor,
          onSurfaceVariant: effectiveForegroundColor,
        ),
        dividerTheme: theme.dividerTheme.copyWith(
          color: effectiveForegroundColor,
        ),
        iconTheme: theme.iconTheme.copyWith(
          color: effectiveForegroundColor,
        ),
        textTheme: theme.textTheme.copyWith(
          bodyMedium: TextStyle(color: effectiveForegroundColor),
        ),
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: effectiveBackgroundColor,
        elevation: elevation!,
        borderRadius: borderRadius ?? BorderRadius.circular(32.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: kToolbarHeight,
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}

mixin FloatingToolbarItem on StatelessWidget {}

class FloatingToolbarButton extends StatelessWidget with FloatingToolbarItem {
  final Widget child;
  final VoidCallback? onPressed;

  const FloatingToolbarButton({
    required this.child,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: kToolbarHeight,
          minWidth: kToolbarHeight,
        ),
        child: child,
      ),
    );
  }
}

class FloatingToolbarDivider extends StatelessWidget with FloatingToolbarItem {
  const FloatingToolbarDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: kToolbarHeight - 24.0,
      ),
      child: VerticalDivider(width: 0),
    );
  }
}
