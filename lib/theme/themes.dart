import 'package:flutter/material.dart';

import '../enum/enum.dart';

ThemeData primaryThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondary,
        error: Colors.red,
        onBackground: AppColors.secondary,
        surface: AppColors.secondary,
        onError: Colors.red,
        onPrimary: AppColors.primary,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        background: AppColors.secondary,
        brightness: Brightness.dark));

ThemeData deuteranopiThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondaryDeuteranopi,
        error: Colors.red,
        onBackground: AppColors.secondaryDeuteranopi,
        surface: AppColors.secondaryDeuteranopi,
        onError: Colors.red,
        onPrimary: AppColors.primaryDeuteranopi,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        background: AppColors.secondaryDeuteranopi,
        brightness: Brightness.dark));

ThemeData protanopiaThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondaryProtanopia,
        error: Colors.red,
        onBackground: AppColors.secondaryProtanopia,
        surface: AppColors.secondaryProtanopia,
        onError: Colors.red,
        onPrimary: AppColors.primaryProtanopia,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        background: AppColors.secondaryProtanopia,
        brightness: Brightness.dark));

ThemeData tritanopiaThemeData = ThemeData(
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
        primary: Colors.red,
        secondary: AppColors.secondaryTritanopia,
        error: Colors.red,
        onBackground: AppColors.secondaryTritanopia,
        surface: AppColors.secondaryTritanopia,
        onError: Colors.red,
        onPrimary: AppColors.primaryTritanopia,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        background: AppColors.secondaryTritanopia,
        brightness: Brightness.dark));
