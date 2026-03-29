import 'package:auto_route/auto_route.dart';
import 'package:core_kit/app_bar/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/src/common/notification_button_widget.dart';

@RoutePage()
class ContestScreen extends StatelessWidget {
  const ContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        disableBack: true,
        hideBack: true,
        title: AppString.contest,
        appbarConfig: AppbarConfig(titleSpacing: 16, actions: [const NotificationButtonWidget()]),
      ),
    );
  }
}
