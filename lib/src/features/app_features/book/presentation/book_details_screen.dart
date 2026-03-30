import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/constance/headline_widget.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/features/app_features/book/presentation/widgets/book_details_appbar_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/book/presentation/widgets/ratting_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/book/presentation/widgets/success_vote_dailog_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/book/presentation/widgets/user_review_card_widget.dart';

@RoutePage()
class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        disableBack: true,
        hideBack: true,
        titleWidget: const BookDetailsAppbarWidget(),
        appbarConfig: AppbarConfig(height: 158.h),
      ),
      body: SmartListLoader(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 30,
        topWidget: _topWidget(context),
        itemBuilder: (context, index) {
          return const UserReviewCardWidget();
        },
      ),
    );
  }

  Widget _topWidget(BuildContext context) {
    return Column(
      children: [
        10.height,
        Row(
          children: [
            topMenu(
              icon: Icons.menu_book_outlined,
              title: '87',
              subtile: AppString.chapters,
              context: context,
            ),
            topMenu(
              icon: Icons.access_time,
              title: AppString.completed,
              subtile: AppString.status,
              context: context,
            ),
            topMenu(
              icon: Icons.electric_bolt_outlined,
              title: '70',
              subtile: AppString.power_stones,
              context: context,
            ),
          ],
        ),
        10.height,

        _powerStones(context),
        15.height,
        CommonButton(
          titleText: AppString.start_reading,
          gradient: context.color.ctaGradientBackgroundAccent,
          prefix: const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 30),
          onTap: () {
            context.router.popUntil((route) => route.settings.name == NavigationRoute.name);
            context.router.navigate(const ReadRoute());
          },
        ),
        20.height,
        CommonButton(
          titleText: AppString.vote,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const Dialog(child: SuccessVoteDialogWidget()),
            );
          },
          gradient: const LinearGradient(
            transform: GradientRotation(3.141592653589793),
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0, 1],
            colors: [Color(0xFF6f1f9d), Color(0xFF8E44FF)],
          ),
          prefix: const Icon(Icons.electric_bolt_outlined, color: Colors.white, size: 20),
        ),
        10.height,
        HeadlineWidget(title: AppString.short_bio).start,
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: context.color.bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: context.color.subtleOverlaysShadows),
          ),
          child: const CommonText(
            text:
                'She was his assistant. He was her boss. But the lines between business and pleasure blur in this steamy romance. She was his assistant. He was her boss. But the lines between business and pleasure blur in this steamy romance. She was his assistant. He was her boss. But the lines between business and pleasure blur in this steamy romance. She was his assistant. He was her boss. But the lines between business and pleasure blur in this steamy romance.',
            textAlign: .left,
            isDescription: true,
            fontSize: 12,
          ),
        ),

        20.height,
        const RatingWidget(),
        10.height,
      ],
    );
  }

  Widget topMenu({
    required IconData icon,
    required String title,
    required String subtile,
    required BuildContext context,
  }) {
    return Expanded(
      child: Card(
        color: context.color.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            10.height,
            Icon(icon, color: context.color.purple400, size: 34),
            CommonText(text: title, textColor: context.color.headingBoldText, fontSize: 18),
            CommonText(text: subtile, textColor: context.color.subtext, fontSize: 14),
            10.height,
          ],
        ),
      ),
    );
  }

  Widget _powerStones(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const PowerStonesRoute());
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xffe89100),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xffeda733),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(Icons.electric_bolt_outlined, color: Colors.white),
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CommonText(
                    text: AppString.power_stones,
                    fontSize: 18,
                    textColor: context.color.buttonTextWhite,
                    fontWeight: .bold,
                  ),
                  CommonText(
                    text: AppString.earn_rewards,
                    fontSize: 14,
                    fontWeight: .w500,
                    textColor: context.color.buttonTextWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
