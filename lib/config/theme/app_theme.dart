import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return _theme(
      ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get dark {
    return _theme(
      ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
    );
  }

  static ThemeData _theme(ColorScheme colorScheme) {
    return ThemeData(
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: colorScheme.brightness,
        barBackgroundColor: Colors.transparent,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        year2023: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        hoverColor: colorScheme.surfaceContainerLowest,
        focusColor: colorScheme.primary,
        iconColor: colorScheme.onSurfaceVariant,
        suffixIconColor: colorScheme.onSurfaceVariant,
        prefixIconColor: colorScheme.onSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.semiSmallBorderRadius),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: Dimensions.mediumBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.semiSmallBorderRadius),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: Dimensions.mediumBorderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.semiSmallBorderRadius),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: Dimensions.mediumBorderWidth,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.semiSmallBorderRadius),
          borderSide: BorderSide(
            color: colorScheme.errorContainer,
            width: Dimensions.mediumBorderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.semiSmallBorderRadius),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: Dimensions.mediumBorderWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.semiSmallBorderRadius),
          borderSide: BorderSide(
            color: colorScheme.outlineVariant,
            width: Dimensions.mediumBorderWidth,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontFamily: "Khuja"),
        displayMedium: TextStyle(fontFamily: "Khuja"),
        displaySmall: TextStyle(fontFamily: "Khuja"),
        titleLarge: TextStyle(fontFamily: "Khuja"),
        titleMedium: TextStyle(fontFamily: "Khuja"),
        titleSmall: TextStyle(fontFamily: "Khuja"),
      ),
    );
  }
}
