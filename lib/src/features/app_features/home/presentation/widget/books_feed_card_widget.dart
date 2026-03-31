import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/constants.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';

class BookFeedCardWidget extends StatelessWidget {
  const BookFeedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const BookDetailsRoute());
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: .start,
          children: [
            const CommonImage(src: Constants.sampleImage, width: 83, height: 120, borderRadius: 14),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                    text: 'Love in the Boardroom',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  2.height,
                  CommonText(
                    text: 'Victoria Sterling',
                    style: TextStyle(fontSize: 14, color: context.color.subtext),
                  ),
                  4.height,
                  const CommonText(
                    text:
                        'She was his assistant. He was her boss. But the lines between business and pleasure blur in this steamy romance.',
                    maxLines: 3,
                    textAlign: .left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, height: 1.4, color: Color(0xFF424242)),
                  ),
                  10.height,

                  Row(
                    children: [
                      _buildActionItem(Icons.star_border_outlined, '4.8'),
                      20.width,
                      _buildActionItem(Icons.chat_bubble_outline_rounded, '8932'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF9EA7B5)),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF9EA7B5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
