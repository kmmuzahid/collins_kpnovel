import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';

@RoutePage()
class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStringsCore.wishlist_title,
        hideBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, size: 60, color: Colors.grey),
              10.height,
              const CommonText(
                text: 'Your wishlist is empty',
                textColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
