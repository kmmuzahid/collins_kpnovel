import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/constants.dart';
import 'package:riverpod_tamplates/config/corekit/back_button.dart';
import 'package:riverpod_tamplates/src/common/share_icon_button.dart';

class BookDetailsAppbarWidget extends StatelessWidget {
  const BookDetailsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),

      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButtonWidget(),
              CommonText(
                text: 'Shadow of the Violet Moon',
                autoResize: false,
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ShareIconButton(),
            ],
          ),
          10.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonImage(
                src: Constants.sampleImage,
                height: 82,
                width: 60,
                borderRadius: 8,
                borderWidth: 1,
                borderOffset: 1,
                enableAspectRatio: true,
                borderColor: Colors.white,
              ),
              const SizedBox(width: 16),

              // 2. Book Info Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• Elena Nightshade',
                      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                    ),
                    6.height,

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildStatChip(Icons.star, '4.8', const Color(0xFF3B1E99)),
                          const SizedBox(width: 8),
                          _buildStatChip(
                            Icons.people_outline,
                            '1.2M reviews',
                            const Color(0xFF3B1E99),
                          ),
                          const SizedBox(width: 8),
                          _buildStatChip(null, 'Age Demand: 18+', const Color(0xFF3B1E99)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 4. Genre Tags
                    Row(
                      children: [
                        _buildGenreTag('Fantasy'),
                        const SizedBox(width: 8),
                        _buildGenreTag('Romance'),
                        const SizedBox(width: 8),
                        _buildGenreTag('Magic'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for the dark stat chips
  Widget _buildStatChip(IconData? icon, String label, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: icon == Icons.star ? Colors.amber : Colors.white, size: 16),
            const SizedBox(width: 4),
          ],
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  // Helper for the light genre tags
  Widget _buildGenreTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.deepPurple, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
