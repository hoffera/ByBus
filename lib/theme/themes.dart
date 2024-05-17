import 'package:flutter/material.dart';

import '../enum/enum.dart';

ThemeData primaryThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondary,
        error: Colors.red,
        surface: AppColors.secondary,
        onError: Colors.red,
        onPrimary: AppColors.primary,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        brightness: Brightness.dark));

ThemeData deuteranopiThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondaryDeuteranopi,
        error: Colors.red,
        surface: AppColors.secondaryDeuteranopi,
        onError: Colors.red,
        onPrimary: AppColors.primaryDeuteranopi,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        brightness: Brightness.dark));

ThemeData protanopiaThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondaryProtanopia,
        error: Colors.red,
        surface: AppColors.secondaryProtanopia,
        onError: Colors.red,
        onPrimary: AppColors.primaryProtanopia,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        brightness: Brightness.dark));

ThemeData tritanopiaThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondaryTritanopia,
        error: Colors.red,
        surface: AppColors.secondaryTritanopia,
        onError: Colors.red,
        onPrimary: AppColors.primaryTritanopia,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        brightness: Brightness.dark));
