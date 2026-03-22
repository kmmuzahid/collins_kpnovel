import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/src/constants/app_colors.dart';
import 'package:riverpod_tamplates/src/utils/theme_extension.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  extensions: const [
    AppThemeExtension(
      primaryColor: AppColors.primary,
      secondaryColor: AppColors.secondary,
    ),
  ],
);
