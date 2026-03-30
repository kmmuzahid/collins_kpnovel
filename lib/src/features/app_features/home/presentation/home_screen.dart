import 'package:auto_route/auto_route.dart';
import 'package:core_kit/text/common_text.dart';
import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: topMenu(
                context,
                Icons.book,
                'Library',
                'Manage your books',
                () {},
                Colors.amber,
              ),
            ),
            16.width,
            Expanded(
              child: topMenu(
                context,
                Icons.book,
                'Library',
                'Manage your books',
                () {},
                Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget topMenu(
    BuildContext context,
    IconData icon,
    String title,
    String subTitle,
    VoidCallback onTap,
    Color color,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            16.width,
            CommonText(
              text: title,
              textColor: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CommonText(text: subTitle, textColor: Colors.white60, fontSize: 12),
          ],
        ),
      ),
    );
  }
}
