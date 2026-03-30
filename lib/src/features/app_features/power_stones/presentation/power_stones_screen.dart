import 'package:auto_route/auto_route.dart';
import 'package:core_kit/app_bar/common_app_bar.dart';
import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/src/features/app_features/power_stones/presentation/widgets/daily_reward_claim_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/power_stones/presentation/widgets/how_to_use_step_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/power_stones/presentation/widgets/power_stone_card.dart';
import 'package:riverpod_tamplates/src/features/app_features/power_stones/presentation/widgets/watch_ad_card_widget.dart';

@RoutePage()
class PowerStonesScreen extends StatelessWidget {
  const PowerStonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.power_stones),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.height,
              const PowerStonesCard(),
              10.height,
              const SizedBox(height: 100, child: DailyBonusBanner()),
              15.height,
              const WatchAdsCardWidget(),
              15.height,
              const HowToUseStepWidget(),
              50.height,
            ],
          ),
        ),
      ),
    );
  }
}
