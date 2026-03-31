import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/src/features/app_features/story/presentation/widget/story_card_widget.dart';

@RoutePage()
class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.Short_Stories),
      body: SmartListLoader(
        itemCount: 30,
        itemBuilder: (context, index) {
          return const StoryCardWidget();
        },
      ),
    );
  }
}
