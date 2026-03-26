import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.bgColor,
    required this.cardsInputFields,
    required this.subtleOverlaysShadows,
    required this.headingBoldText,
    required this.bodyText,
    required this.buttonTextWhite,
    required this.secondaryTextPlaceholder,
    required this.navbarTabBarBgClr,
    required this.navbarIconsUnselected,
    required this.inputBorderFocus,
    required this.errorTextValidation,
    required this.successMessages,
    required this.subtext,
    required this.iconClr,
    // --- gradient / brand colors ---
    required this.ctaGradientNavbarSelected,
    required this.ctaGradientLogo,
    required this.ctaGradientBackgroundAccent,
    required this.ctaGradientSparkles,
    required this.ctaButtonsText,
    // --- foundation blue scale ---
    required this.blue50,
    required this.blue100,
    required this.blue200,
    required this.blue300,
    required this.blue400,
    required this.blue500,
    required this.blue600,
    required this.blue700,
    required this.blue800,
    required this.blue900,
    // --- foundation purple scale ---
    required this.purple50,
    required this.purple100,
    required this.purple200,
    required this.purple300,
    required this.purple400,
    required this.purple500,
    required this.purple600,
    required this.purple700,
    required this.purple800,
    required this.purple900,
  });

  final Color bgColor;
  final Color cardsInputFields;
  final Color subtleOverlaysShadows;
  final Color headingBoldText;
  final Color bodyText;
  final Color buttonTextWhite;
  final Color secondaryTextPlaceholder;
  final Color navbarTabBarBgClr;
  final Color navbarIconsUnselected;
  final Color inputBorderFocus;
  final Color errorTextValidation;
  final Color successMessages;
  final Color subtext;
  final Color iconClr;

  final LinearGradient ctaGradientNavbarSelected;
  final LinearGradient ctaGradientLogo;
  final LinearGradient ctaGradientBackgroundAccent;
  final LinearGradient ctaGradientSparkles;
  final Color ctaButtonsText;

  final Color blue50;
  final Color blue100;
  final Color blue200;
  final Color blue300;
  final Color blue400;
  final Color blue500;
  final Color blue600;
  final Color blue700;
  final Color blue800;
  final Color blue900;

  final Color purple50;
  final Color purple100;
  final Color purple200;
  final Color purple300;
  final Color purple400;
  final Color purple500;
  final Color purple600;
  final Color purple700;
  final Color purple800;
  final Color purple900;

  // -------------------------------------------------------------------------
  // Light mode factory
  // -------------------------------------------------------------------------
  factory AppColors.light() => const AppColors(
    bgColor: Color(0xFFFFFFFF),
    cardsInputFields: Color(0xFFF5F5F5),
    subtleOverlaysShadows: Color(0xFFEEEEEE),
    headingBoldText: Color(0xFF121212),
    bodyText: Color(0xFF333333),
    buttonTextWhite: Color(0xFFFFFFFF),
    secondaryTextPlaceholder: Color(0xFF888888),
    navbarTabBarBgClr: Color(0xFFFFFFFF),
    navbarIconsUnselected: Color(0xFF888888),
    inputBorderFocus: Color(0xFF4A90FF),
    errorTextValidation: Color(0xFFFF4C4C),
    successMessages: Color(0xFF00BFA6),
    subtext: Color(0xFF6A7282),
    iconClr: Color(0xFF99A1AF),
    ctaGradientNavbarSelected: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
    ),
    ctaGradientLogo: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF0096F3), Color(0xFFE069F6)],
    ),
    ctaGradientBackgroundAccent: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF1C1CFF), Color(0xFF8E44FF)],
    ),
    ctaGradientSparkles: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF9BFFFB), Color(0xFFD0B3FF)],
    ),
    ctaButtonsText: Color(0xFF1C1CFF),
    // blue scale
    blue50: Color(0xFFFFD700),
    blue100: Color(0xFFBAB9FF),
    blue200: Color(0xFF9998FF),
    blue300: Color(0xFF6B68FE),
    blue400: Color(0xFF4E4BFE),
    blue500: Color(0xFF221EFE),
    blue600: Color(0xFF1F1BE7),
    blue700: Color(0xFF1815B4),
    blue800: Color(0xFF13118C),
    blue900: Color(0xFF0E0D6B),
    // purple scale
    purple50: Color(0xFFF3ECFF),
    purple100: Color(0xFFD9C4FF),
    purple200: Color(0xFFC6A8FF),
    purple300: Color(0xFFAD80FF),
    purple400: Color(0xFF9D67FF),
    purple500: Color(0xFF8441FF),
    purple600: Color(0xFF783BE8),
    purple700: Color(0xFF5E2EB5),
    purple800: Color(0xFF49248C),
    purple900: Color(0xFF371B6B),
  );

  // -------------------------------------------------------------------------
  // Dark mode factory
  // -------------------------------------------------------------------------
  factory AppColors.dark() => const AppColors(
    bgColor: Color(0xFF0E0E0E),
    cardsInputFields: Color(0xFF1A1A1A),
    subtleOverlaysShadows: Color(0xFF2A2A2A),
    headingBoldText: Color(0xFFF5F5F5),
    bodyText: Color(0xFFD4D4D4),
    buttonTextWhite: Color(0xFFFFFFFF),
    secondaryTextPlaceholder: Color(0xFF6B6B6B),
    navbarTabBarBgClr: Color(0xFF141414),
    navbarIconsUnselected: Color(0xFF5C5C5C),
    inputBorderFocus: Color(0xFF4A90FF),
    errorTextValidation: Color(0xFFFF5252),
    successMessages: Color(0xFF00BFA6),
    subtext: Color(0xFF8A8FA9),
    iconClr: Color(0xFF5A6070),
    // gradients are brand identity — unchanged in dark mode
    ctaGradientNavbarSelected: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
    ),
    ctaGradientLogo: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF0096F3), Color(0xFFE069F6)],
    ),
    ctaGradientBackgroundAccent: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF1C1CFF), Color(0xFF8E44FF)],
    ),
    ctaGradientSparkles: LinearGradient(
      transform: GradientRotation(3.141592653589793),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [Color(0xFF9BFFFB), Color(0xFFD0B3FF)],
    ),
    ctaButtonsText: Color(0xFF7B7BFF),
    // blue scale — slightly brighter so they read on dark surfaces
    blue50: Color(0xFFFFD700),
    blue100: Color(0xFFBAB9FF),
    blue200: Color(0xFF9998FF),
    blue300: Color(0xFF6B68FE),
    blue400: Color(0xFF4E4BFE),
    blue500: Color(0xFF221EFE),
    blue600: Color(0xFF1F1BE7),
    blue700: Color(0xFF1815B4),
    blue800: Color(0xFF13118C),
    blue900: Color(0xFF0E0D6B),
    // purple scale — unchanged; already works on dark backgrounds
    purple50: Color(0xFFF3ECFF),
    purple100: Color(0xFFD9C4FF),
    purple200: Color(0xFFC6A8FF),
    purple300: Color(0xFFAD80FF),
    purple400: Color(0xFF9D67FF),
    purple500: Color(0xFF8441FF),
    purple600: Color(0xFF783BE8),
    purple700: Color(0xFF5E2EB5),
    purple800: Color(0xFF49248C),
    purple900: Color(0xFF371B6B),
  );

  // -------------------------------------------------------------------------
  // ThemeExtension overrides
  // -------------------------------------------------------------------------

  @override
  AppColors copyWith({
    Color? bgColor,
    Color? cardsInputFields,
    Color? subtleOverlaysShadows,
    Color? headingBoldText,
    Color? bodyText,
    Color? buttonTextWhite,
    Color? secondaryTextPlaceholder,
    Color? navbarTabBarBgClr,
    Color? navbarIconsUnselected,
    Color? inputBorderFocus,
    Color? errorTextValidation,
    Color? successMessages,
    Color? subtext,
    Color? iconClr,
    LinearGradient? ctaGradientNavbarSelected,
    LinearGradient? ctaGradientLogo,
    LinearGradient? ctaGradientBackgroundAccent,
    LinearGradient? ctaGradientSparkles,
    Color? ctaButtonsText,
    Color? blue50,
    Color? blue100,
    Color? blue200,
    Color? blue300,
    Color? blue400,
    Color? blue500,
    Color? blue600,
    Color? blue700,
    Color? blue800,
    Color? blue900,
    Color? purple50,
    Color? purple100,
    Color? purple200,
    Color? purple300,
    Color? purple400,
    Color? purple500,
    Color? purple600,
    Color? purple700,
    Color? purple800,
    Color? purple900,
  }) {
    return AppColors(
      bgColor: bgColor ?? this.bgColor,
      cardsInputFields: cardsInputFields ?? this.cardsInputFields,
      subtleOverlaysShadows: subtleOverlaysShadows ?? this.subtleOverlaysShadows,
      headingBoldText: headingBoldText ?? this.headingBoldText,
      bodyText: bodyText ?? this.bodyText,
      buttonTextWhite: buttonTextWhite ?? this.buttonTextWhite,
      secondaryTextPlaceholder: secondaryTextPlaceholder ?? this.secondaryTextPlaceholder,
      navbarTabBarBgClr: navbarTabBarBgClr ?? this.navbarTabBarBgClr,
      navbarIconsUnselected: navbarIconsUnselected ?? this.navbarIconsUnselected,
      inputBorderFocus: inputBorderFocus ?? this.inputBorderFocus,
      errorTextValidation: errorTextValidation ?? this.errorTextValidation,
      successMessages: successMessages ?? this.successMessages,
      subtext: subtext ?? this.subtext,
      iconClr: iconClr ?? this.iconClr,
      ctaGradientNavbarSelected: ctaGradientNavbarSelected ?? this.ctaGradientNavbarSelected,
      ctaGradientLogo: ctaGradientLogo ?? this.ctaGradientLogo,
      ctaGradientBackgroundAccent: ctaGradientBackgroundAccent ?? this.ctaGradientBackgroundAccent,
      ctaGradientSparkles: ctaGradientSparkles ?? this.ctaGradientSparkles,
      ctaButtonsText: ctaButtonsText ?? this.ctaButtonsText,
      blue50: blue50 ?? this.blue50,
      blue100: blue100 ?? this.blue100,
      blue200: blue200 ?? this.blue200,
      blue300: blue300 ?? this.blue300,
      blue400: blue400 ?? this.blue400,
      blue500: blue500 ?? this.blue500,
      blue600: blue600 ?? this.blue600,
      blue700: blue700 ?? this.blue700,
      blue800: blue800 ?? this.blue800,
      blue900: blue900 ?? this.blue900,
      purple50: purple50 ?? this.purple50,
      purple100: purple100 ?? this.purple100,
      purple200: purple200 ?? this.purple200,
      purple300: purple300 ?? this.purple300,
      purple400: purple400 ?? this.purple400,
      purple500: purple500 ?? this.purple500,
      purple600: purple600 ?? this.purple600,
      purple700: purple700 ?? this.purple700,
      purple800: purple800 ?? this.purple800,
      purple900: purple900 ?? this.purple900,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      bgColor: Color.lerp(bgColor, other.bgColor, t)!,
      cardsInputFields: Color.lerp(cardsInputFields, other.cardsInputFields, t)!,
      subtleOverlaysShadows: Color.lerp(subtleOverlaysShadows, other.subtleOverlaysShadows, t)!,
      headingBoldText: Color.lerp(headingBoldText, other.headingBoldText, t)!,
      bodyText: Color.lerp(bodyText, other.bodyText, t)!,
      buttonTextWhite: Color.lerp(buttonTextWhite, other.buttonTextWhite, t)!,
      secondaryTextPlaceholder: Color.lerp(
        secondaryTextPlaceholder,
        other.secondaryTextPlaceholder,
        t,
      )!,
      navbarTabBarBgClr: Color.lerp(navbarTabBarBgClr, other.navbarTabBarBgClr, t)!,
      navbarIconsUnselected: Color.lerp(navbarIconsUnselected, other.navbarIconsUnselected, t)!,
      inputBorderFocus: Color.lerp(inputBorderFocus, other.inputBorderFocus, t)!,
      errorTextValidation: Color.lerp(errorTextValidation, other.errorTextValidation, t)!,
      successMessages: Color.lerp(successMessages, other.successMessages, t)!,
      subtext: Color.lerp(subtext, other.subtext, t)!,
      iconClr: Color.lerp(iconClr, other.iconClr, t)!,
      ctaGradientNavbarSelected: LinearGradient.lerp(
        ctaGradientNavbarSelected,
        other.ctaGradientNavbarSelected,
        t,
      )!,
      ctaGradientLogo: LinearGradient.lerp(ctaGradientLogo, other.ctaGradientLogo, t)!,
      ctaGradientBackgroundAccent: LinearGradient.lerp(
        ctaGradientBackgroundAccent,
        other.ctaGradientBackgroundAccent,
        t,
      )!,
      ctaGradientSparkles: LinearGradient.lerp(ctaGradientSparkles, other.ctaGradientSparkles, t)!,
      ctaButtonsText: Color.lerp(ctaButtonsText, other.ctaButtonsText, t)!,
      blue50: Color.lerp(blue50, other.blue50, t)!,
      blue100: Color.lerp(blue100, other.blue100, t)!,
      blue200: Color.lerp(blue200, other.blue200, t)!,
      blue300: Color.lerp(blue300, other.blue300, t)!,
      blue400: Color.lerp(blue400, other.blue400, t)!,
      blue500: Color.lerp(blue500, other.blue500, t)!,
      blue600: Color.lerp(blue600, other.blue600, t)!,
      blue700: Color.lerp(blue700, other.blue700, t)!,
      blue800: Color.lerp(blue800, other.blue800, t)!,
      blue900: Color.lerp(blue900, other.blue900, t)!,
      purple50: Color.lerp(purple50, other.purple50, t)!,
      purple100: Color.lerp(purple100, other.purple100, t)!,
      purple200: Color.lerp(purple200, other.purple200, t)!,
      purple300: Color.lerp(purple300, other.purple300, t)!,
      purple400: Color.lerp(purple400, other.purple400, t)!,
      purple500: Color.lerp(purple500, other.purple500, t)!,
      purple600: Color.lerp(purple600, other.purple600, t)!,
      purple700: Color.lerp(purple700, other.purple700, t)!,
      purple800: Color.lerp(purple800, other.purple800, t)!,
      purple900: Color.lerp(purple900, other.purple900, t)!,
    );
  }
}
