import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/gen/assets.gen.dart';

class NotificationButtonWidget extends StatelessWidget {
  const NotificationButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Badge(
        label: const Text('1'),
        child: CommonImage(
          src: Assets.images.notificaiton,
          imageColor: context.color.buttonTextWhite,
        ),
      ),
    );
  }
}
