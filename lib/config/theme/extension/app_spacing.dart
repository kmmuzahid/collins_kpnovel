import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    required this.base,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s7,
    required this.s8,
    required this.s9,
    required this.s10,
    required this.s11,
    required this.s12,
    required this.s13,
    required this.s14,
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusXl,
    required this.radius2xl,
    required this.radius3xl,
  });

  final double base;
  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s7;
  final double s8;
  final double s9;
  final double s10;
  final double s11;
  final double s12;
  final double s13;
  final double s14;
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;
  final double radiusXl;
  final double radius2xl;
  final double radius3xl;

  // Convenience BorderRadius getters
  BorderRadius get borderRadiusSm => BorderRadius.circular(radiusSm);
  BorderRadius get borderRadiusMd => BorderRadius.circular(radiusMd);
  BorderRadius get borderRadiusLg => BorderRadius.circular(radiusLg);
  BorderRadius get borderRadiusXl => BorderRadius.circular(radiusXl);
  BorderRadius get borderRadius2xl => BorderRadius.circular(radius2xl);
  BorderRadius get borderRadius3xl => BorderRadius.circular(radius3xl);

  factory AppSpacing.defaultScale() => const AppSpacing(
    base: 4,
    s1: 8,
    s2: 12,
    s3: 16,
    s4: 20,
    s5: 24,
    s6: 32,
    s7: 40,
    s8: 48,
    s9: 56,
    s10: 64,
    s11: 72,
    s12: 80,
    s13: 88,
    s14: 96,
    radiusSm: 4,
    radiusMd: 8,
    radiusLg: 16,
    radiusXl: 32,
    radius2xl: 128,
    radius3xl: 360,
  );

  @override
  AppSpacing copyWith({
    double? base,
    double? s1,
    double? s2,
    double? s3,
    double? s4,
    double? s5,
    double? s6,
    double? s7,
    double? s8,
    double? s9,
    double? s10,
    double? s11,
    double? s12,
    double? s13,
    double? s14,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? radiusXl,
    double? radius2xl,
    double? radius3xl,
  }) {
    return AppSpacing(
      base: base ?? this.base,
      s1: s1 ?? this.s1,
      s2: s2 ?? this.s2,
      s3: s3 ?? this.s3,
      s4: s4 ?? this.s4,
      s5: s5 ?? this.s5,
      s6: s6 ?? this.s6,
      s7: s7 ?? this.s7,
      s8: s8 ?? this.s8,
      s9: s9 ?? this.s9,
      s10: s10 ?? this.s10,
      s11: s11 ?? this.s11,
      s12: s12 ?? this.s12,
      s13: s13 ?? this.s13,
      s14: s14 ?? this.s14,
      radiusSm: radiusSm ?? this.radiusSm,
      radiusMd: radiusMd ?? this.radiusMd,
      radiusLg: radiusLg ?? this.radiusLg,
      radiusXl: radiusXl ?? this.radiusXl,
      radius2xl: radius2xl ?? this.radius2xl,
      radius3xl: radius3xl ?? this.radius3xl,
    );
  }

  @override
  AppSpacing lerp(AppSpacing? other, double t) {
    if (other == null) return this;
    return AppSpacing(
      base: lerpDouble(base, other.base, t)!,
      s1: lerpDouble(s1, other.s1, t)!,
      s2: lerpDouble(s2, other.s2, t)!,
      s3: lerpDouble(s3, other.s3, t)!,
      s4: lerpDouble(s4, other.s4, t)!,
      s5: lerpDouble(s5, other.s5, t)!,
      s6: lerpDouble(s6, other.s6, t)!,
      s7: lerpDouble(s7, other.s7, t)!,
      s8: lerpDouble(s8, other.s8, t)!,
      s9: lerpDouble(s9, other.s9, t)!,
      s10: lerpDouble(s10, other.s10, t)!,
      s11: lerpDouble(s11, other.s11, t)!,
      s12: lerpDouble(s12, other.s12, t)!,
      s13: lerpDouble(s13, other.s13, t)!,
      s14: lerpDouble(s14, other.s14, t)!,
      radiusSm: lerpDouble(radiusSm, other.radiusSm, t)!,
      radiusMd: lerpDouble(radiusMd, other.radiusMd, t)!,
      radiusLg: lerpDouble(radiusLg, other.radiusLg, t)!,
      radiusXl: lerpDouble(radiusXl, other.radiusXl, t)!,
      radius2xl: lerpDouble(radius2xl, other.radius2xl, t)!,
      radius3xl: lerpDouble(radius3xl, other.radius3xl, t)!,
    );
  }
}

// ---------------------------------------------------------------------------
// AppTextStyles – text style tokens as a ThemeExtension
// ---------------------------------------------------------------------------
