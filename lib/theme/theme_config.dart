import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  // Font sizes
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 14.0;
  static const double largeFontSize = 18.0;
  static const double xLargeFontSize = 24.0;
  static const double xxLargeFontSize = 32.0;

  // Padding
  static const double smallPadding = 8.0;
  static const double defaultPadding = 12.0;
  static const double largePadding = 24.0;

  // Border radius
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 20.0;

  // Icon sizes
  static const double smallIconSize = 16.0;
  static const double mediumIconSize = 24.0;
  static const double largeIconSize = 32.0;

  // Custom color scheme for light mode
  static const FlexSchemeColor _lightColors = FlexSchemeColor(
    primary: Color(0xFF1565C0),
    secondary: Color(0xFFF2F4F8),
  );

  // Custom color scheme for dark mode
  static const FlexSchemeColor _darkColors = FlexSchemeColor(
    primary: Color(0xFF1565C0),
    secondary: Color(0xFF1C1C1E),
  );

  static ThemeData light = FlexThemeData.light(
    colors: _lightColors,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      defaultRadius: AppTheme.defaultBorderRadius,
    ),

    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  static ThemeData dark = FlexThemeData.dark(
    colors: _darkColors,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      defaultRadius: AppTheme.defaultBorderRadius,
    ),

    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
