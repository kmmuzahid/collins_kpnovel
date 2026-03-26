import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';

@RoutePage()
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, size: 80, color: Colors.amber),
            40.height,
            const CommonText(
              text: AppStrings.onboarding_welcome,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            20.height,
            const CommonText(
              text: AppStrings.onboarding_desc,
              textAlign: TextAlign.center,
            ),
            60.height,
            CommonButton(
              titleText: 'Get Started',
              onTap: () => appRouter.replace(const LoginRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
