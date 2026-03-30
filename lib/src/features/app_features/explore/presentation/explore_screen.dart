import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/common/notification_button_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/explore/presentation/widgets/explore_inital_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/explore/presentation/widgets/explore_result_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/explore/riverpod/explore_notifire.dart';

@RoutePage()
class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreNotifireProvider);
    final notifier = ref.read(exploreNotifireProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(context, notifier),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: state.searchText.isNotEmpty
            ? const ExploreResultWidget()
            : const ExploreInitalWidget(),
      ),
    );
  }

  CommonAppBar _appbar(BuildContext context, ExploreNotifire notifier) {
    return CommonAppBar(
      appbarConfig: AppbarConfig(height: 85.h),
      titleWidget: Column(
        children: [
          Row(
            children: [
              16.width,
              CommonText(
                text: AppString.Explore,
                fontSize: 24,
                fontWeight: .bold,
                textColor: context.color.buttonTextWhite,
              ),
              const Spacer(),
              const NotificationButtonWidget(),
              16.width,
            ],
          ),
          8.height,
          Row(
            children: [
              16.width,
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CommonTextField(
                    onChanged: (value) {
                      notifier.onSearchChanged(value);
                    },
                    validationType: .notRequired,
                    backgroundColor: context.color.blue300.withValues(alpha: 0.4),
                    borderWidth: 1.2,
                    borderColor: context.color.cardsInputFields.withValues(alpha: 0.5),
                    hintText: AppString.search_by_title_author_or_genre,
                    borderRadius: 40,
                    textStyle: const TextStyle(color: Colors.white),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: context.color.buttonTextWhite.withValues(alpha: 0.6),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: context.color.buttonTextWhite.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ),
              10.width,
            ],
          ),
          5.height,
        ],
      ),
      disableBack: true,
      hideBack: true,
    );
  }
}



