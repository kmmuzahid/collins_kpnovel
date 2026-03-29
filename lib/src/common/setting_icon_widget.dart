import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(Icons.settings_outlined, color: context.color.buttonTextWhite),
    );
  }
}
