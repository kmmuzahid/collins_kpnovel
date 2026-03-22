import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color primaryColor;
  final Color secondaryColor;

  const AppThemeExtension({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith({Color? primaryColor, Color? secondaryColor}) {
    return AppThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
    );
  }
}

extension AppThemeExtensionX on BuildContext {
  AppThemeExtension get appColors => Theme.of(this).extension<AppThemeExtension>()!;
}
