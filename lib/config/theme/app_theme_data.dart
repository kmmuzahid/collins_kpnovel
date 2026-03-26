 

import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/theme/extension/app_colors.dart';
import 'package:riverpod_tamplates/config/theme/extension/app_spacing.dart';
import 'package:riverpod_tamplates/config/theme/extension/app_text_style.dart';

extension AppThemeX on BuildContext {
  AppColors get color => Theme.of(this).extension<AppColors>()!;
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
  AppTextStyles get textStyle => Theme.of(this).extension<AppTextStyles>()!;
}

class AppTheme {
  AppTheme._();

  static List<ThemeExtension<dynamic>> get _sharedExtensions => [
    AppSpacing.defaultScale(),
    AppTextStyles.defaultStyles(),
  ];

  static ThemeData get light => ThemeData.light(
    useMaterial3: true,
  ).copyWith(extensions: [AppColors.light(), ..._sharedExtensions]);

  static ThemeData get dark => ThemeData.dark(
    useMaterial3: true,
  ).copyWith(extensions: [AppColors.dark(), ..._sharedExtensions]);
}
