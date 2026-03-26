import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';

@RoutePage()
class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStringsCore.search_title,
        hideBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
        child: Column(
          children: [
            const CommonTextField(
              hintText: 'Search products...',
              prefixIcon: Icon(Icons.search),
              validationType: .notRequired,
            ),
            20.height,
            const Expanded(
              child: Center(
                child: CommonText(
                  text: 'Search for your favorite items',
                  textColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
