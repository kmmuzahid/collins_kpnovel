import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/constance/constants.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, this.isTrending = false, this.isNew = true});

  final bool isTrending;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.navigate(const BookDetailsRoute());
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;
          final tagMaxWidth = (maxWidth - 20.w) / 2;

          return Container(
            width: maxWidth,
            height: maxHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section - Now Expanded to take available vertical space
                Expanded(
                  child: Stack(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          child: CommonImage(src: Constants.sampleImage),
                        ),
                      ),
                      if (isNew || isTrending)
                        Positioned(top: 12, right: 12, child: _buildNewBadge(context)),
                    ],
                  ),
                ),

                // Content Section - Height is determined by its content
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonText(
                        text: 'Echoes of Tomorrow',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      CommonText(
                        text: 'Dr. Sarah Chen',
                        style: TextStyle(fontSize: 12, color: Colors.blueGrey[400]),
                      ),
                      6.height,
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          const Text(
                            '4.8',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: '12,543 ',
                                style: TextStyle(color: context.color.bodyText, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: 'reviews',
                                    style: TextStyle(color: context.color.subtext, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.height,

                      // Tags
                      Wrap(
                        spacing: 2,
                        runSpacing: 2,
                        children: [
                          _buildTag('Sci-Fi', maxWidth: tagMaxWidth),
                          _buildTag('Adventure', maxWidth: tagMaxWidth),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isNew ? const Color(0xFFFFD700) : null,
        gradient: isTrending ? context.color.ctaGradientBackgroundAccent : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isNew ? Icons.auto_awesome : Icons.trending_up_outlined,
            size: 14,
            color: isNew ? const Color(0xFF5E35B1) : Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            isNew ? AppString.New : AppString.Trending,
            style: TextStyle(
              color: isNew ? const Color(0xFF5E35B1) : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, {double? maxWidth}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth ?? 80, minHeight: 40, maxHeight: 40),
      child: CommonText(
        text: label,
        borderColor: Colors.transparent,
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
        backgroundColor: const Color(0xFFF3E5F5),
        borderRadious: 25,
        autoResize: false,
        style: const TextStyle(color: Color(0xFF7B1FA2), fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}
