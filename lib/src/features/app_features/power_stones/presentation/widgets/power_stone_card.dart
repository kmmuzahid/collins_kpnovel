import 'package:core_kit/text/common_text.dart';
import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';

class PowerStonesCard extends StatelessWidget {
  const PowerStonesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.color.bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.color.subtleOverlaysShadows),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.height,
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.electric_bolt_outlined, color: Colors.white, size: 50),
          ),
          10.height,
          const CommonText(
            text: '55',
            style: TextStyle(fontSize: 36, fontWeight: .bold, color: Colors.black),
          ),

          5.height,
          CommonText(
            text: AppString.available_power_stones,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey.shade400,
              fontWeight: FontWeight.w500,
            ),
          ),
          10.height,
        ],
      ),
    );
  }
}
