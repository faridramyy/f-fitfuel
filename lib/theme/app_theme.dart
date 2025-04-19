import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.2.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.shadBlue,
    subThemesData: FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      filledButtonRadius: 10.0,
      inputDecoratorSchemeColor: SchemeColor.primary,
      inputDecoratorIsFilled: true,
      inputDecoratorIsDense: true,
      inputDecoratorContentPadding: const EdgeInsetsDirectional.fromSTEB(
        20,
        20,
        20,
        5,
      ),
      inputDecoratorBackgroundAlpha: 14,
      inputDecoratorBorderSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 10.0,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorFocusedBorderWidth: 1.0,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.onPrimaryFixedVariant,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    textTheme: ThemeData.light().textTheme.copyWith(
      labelLarge: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.shadBlue,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      filledButtonRadius: 10.0,
      inputDecoratorSchemeColor: SchemeColor.primary,
      inputDecoratorIsFilled: true,
      inputDecoratorIsDense: true,
      inputDecoratorContentPadding: EdgeInsetsDirectional.fromSTEB(
        10,
        20,
        20,
        10,
      ),
      inputDecoratorBackgroundAlpha: 45,
      inputDecoratorBorderSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 10.0,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorFocusedBorderWidth: 1.0,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.primaryFixed,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    textTheme: ThemeData.dark().textTheme.copyWith(
      labelLarge: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
