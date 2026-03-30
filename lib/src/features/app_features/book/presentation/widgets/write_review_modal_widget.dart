import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';

class WriteReviewModalWidget extends StatefulWidget {
  const WriteReviewModalWidget({super.key});

  @override
  State<WriteReviewModalWidget> createState() => _WriteReviewModalWidgetState();
}

class _WriteReviewModalWidgetState extends State<WriteReviewModalWidget> {
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // Main card constraints
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      clipBehavior: Clip.antiAlias, // Ensures gradient doesn't bleed past corners
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Purple Gradient Header
          Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: BoxDecoration(gradient: context.color.ctaGradientBackgroundAccent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppString.write_your_review,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    8.height,
                    CommonText(
                      text: AppString.shadow_of_the_violet_moon,
                      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                    ),
                  ],
                ),
                // Close Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),

          // 2. Body Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.your_rating,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                12.height,

                // Rating Bar Placeholder
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                        child: Icon(
                          index < _rating ? Icons.star : Icons.star_outline,
                          color: index < _rating ? Colors.amber : Colors.grey[400],
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),

                24.height,
                CommonText(
                  text: AppString.your_review,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                12.height,

                CommonMultilineTextField(
                  height: 150,
                  hintText: AppString.share_your_thoughts_about_this_book,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  validationType: .validateRequired,
                ),

                const SizedBox(height: 32),

                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFA585FF), Color(0xFFC0A5FF)]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined, color: Colors.white),
                    label: CommonText(
                      text: AppString.submit_review,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
