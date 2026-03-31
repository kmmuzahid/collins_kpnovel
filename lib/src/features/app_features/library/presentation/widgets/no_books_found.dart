import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/gen/assets.gen.dart';

class NoBooksFoundWidget extends StatelessWidget {
  const NoBooksFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      mainAxisSize: .min,
      children: [
        CommonText(
          text: '0 ${AppString.results}',
          fontSize: 18,
          fontWeight: .bold,
          textColor: context.color.headingBoldText,
        ).start,
        32.height,
        CommonImage(src: Assets.images.emptyBooks.path, size: 60, enableAspectRatio: true),
        10.height,
        CommonText(
          text: AppString.no_books_found,
          fontSize: 18,
          fontWeight: .bold,
          textColor: context.color.headingBoldText,
        ),
        5.height,
        CommonText(
          text: AppString.try_adjusting_your_search_or_filters,
          fontSize: 14,
          textColor: context.color.subtext,
        ),
        30.height,
        CommonButton(
          titleText: AppString.explore_books,
          buttonWidth: 80,
          gradient: context.color.ctaGradientBackgroundAccent,
          onTap: () {
            context.router.navigate(const ExploreRoute());
          },
          buttonColor: context.color.inputBorderFocus,
          borderColor: context.color.inputBorderFocus,
        ),
      ],
    );
  }
}
