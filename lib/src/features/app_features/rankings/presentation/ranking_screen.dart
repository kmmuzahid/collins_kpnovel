import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/constance/constants.dart';
import 'package:riverpod_tamplates/config/corekit/back_button.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/features/app_features/rankings/presentation/widgets/ranking_filter_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/rankings/presentation/widgets/top_voted_books.dart';

@RoutePage()
class RankingScreen extends ConsumerWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(
        hideBack: true,
        disableBack: true,
        titleWidget: _appbarBuilder(context, ref),
        appbarConfig: AppbarConfig(height: 140),
      ),
      body: SmartListLoader(
        itemCount: 30,
        padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
        topWidget: Container(
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            color: const Color(0xfffaf5ff),
            borderRadius: BorderRadius.all(Radius.circular(24.r)),
          ),
          child: const TopVotedBooks(),
        ),
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }

  Widget _appbarBuilder(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
      child: Column(
        children: [
          Row(
            children: [
              const BackButtonWidget(),
              CommonText(
                text: AppString.Rankings,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ],
          ),
          8.height,
          const RankingFilterWidget(),
          8.height,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: .center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${AppString.Rankings_based_on} ',
                    style: TextStyle(fontSize: 12.sp, color: Colors.white.withValues(alpha: .8)),
                  ),
                  TextSpan(
                    text: AppString.Power_Stone_Votes,
                    style: TextStyle(
                      color: context.color.blue50,
                      fontWeight: .bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
