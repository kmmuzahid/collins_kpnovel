import 'package:flutter/material.dart';

@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.small,
    required this.small2,
    required this.btn,
    required this.mediumText,
    required this.subTitle,
    required this.title,
    required this.largeTitle,
  });

  final TextStyle small;
  final TextStyle small2;
  final TextStyle btn;
  final TextStyle mediumText;
  final TextStyle subTitle;
  final TextStyle title;
  final TextStyle largeTitle;

  static const _base = TextStyle(leadingDistribution: TextLeadingDistribution.even);

  factory AppTextStyles.defaultStyles() => AppTextStyles(
    small: _base.copyWith(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
    small2: _base.copyWith(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
    btn: _base.copyWith(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
    mediumText: _base.copyWith(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
    subTitle: _base.copyWith(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
    title: _base.copyWith(
      fontFamily: 'Roboto',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
    largeTitle: _base.copyWith(
      fontFamily: 'Poppins',
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
      height: 1,
      letterSpacing: 0,
    ),
  );

  @override
  AppTextStyles copyWith({
    TextStyle? small,
    TextStyle? small2,
    TextStyle? btn,
    TextStyle? mediumText,
    TextStyle? subTitle,
    TextStyle? title,
    TextStyle? largeTitle,
  }) {
    return AppTextStyles(
      small: small ?? this.small,
      small2: small2 ?? this.small2,
      btn: btn ?? this.btn,
      mediumText: mediumText ?? this.mediumText,
      subTitle: subTitle ?? this.subTitle,
      title: title ?? this.title,
      largeTitle: largeTitle ?? this.largeTitle,
    );
  }

  @override
  AppTextStyles lerp(AppTextStyles? other, double t) {
    if (other == null) return this;
    return AppTextStyles(
      small: TextStyle.lerp(small, other.small, t)!,
      small2: TextStyle.lerp(small2, other.small2, t)!,
      btn: TextStyle.lerp(btn, other.btn, t)!,
      mediumText: TextStyle.lerp(mediumText, other.mediumText, t)!,
      subTitle: TextStyle.lerp(subTitle, other.subTitle, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
    );
  }
}
