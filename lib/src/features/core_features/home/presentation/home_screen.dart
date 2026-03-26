import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.home_title, hideBack: true),
      body: Padding(
        padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              text: 'Welcome John!',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            10.height,
            const CommonText(
              text: 'Find your next favorite item here.',
              textColor: Colors.grey,
            ),
            20.height,
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CommonText(text: 'Product $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
