 

import 'package:core_kit/core_kit_internal.dart';
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

  static ThemeData get light => _themeDataBuilder(
    ThemeData.light(
    useMaterial3: true,
    ).copyWith(extensions: [AppColors.light(), ..._sharedExtensions]),
  );

  static ThemeData get dark => _themeDataBuilder(
    ThemeData.dark(
    useMaterial3: true,
    ).copyWith(extensions: [AppColors.dark(), ..._sharedExtensions]),
  );

  static ThemeData _themeDataBuilder(ThemeData themeData) {
    return themeData.copyWith(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeData.extension<AppColors>()?.buttonTextWhite.withValues(alpha: 0.2),
          foregroundColor: themeData.colorScheme.onPrimary,
          minimumSize: const Size(double.infinity, 48),
          elevation: 0,
          side: const BorderSide(width: 0, color: Colors.transparent),
          shadowColor: Colors.transparent,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,

            color: themeData.extension<AppColors>()?.buttonTextWhite,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.r)),
        ),
      ),
    );
  }
}
