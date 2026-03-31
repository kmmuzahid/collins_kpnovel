import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';

class GeneralRankWidget extends StatelessWidget {
  final int rank;
  final String title;
  final String author;
  final double rating;
  final String views;
  final List<String> tags;
  final String imageUrl;

  const GeneralRankWidget({
    super.key,
    required this.rank,
    required this.title,
    required this.author,
    required this.rating,
    required this.views,
    required this.tags,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImage(
                src: imageUrl,
                width: 90,
                height: 120,
                enableAspectRatio: true,
                borderRadius: 14,
              ),
              10.width,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1C1E),
                      ),
                    ),
                    2.height,
                    // Author
                    CommonText(
                      text: author,
                      style: const TextStyle(fontSize: 14, color: Color(0xFF9EA7B5)),
                    ),
                    12.height,
                    // Rating and Views Row
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFD700), size: 20),
                        4.width,
                        CommonText(
                          text: rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          textColor: const Color(0xFF9EA7B5),
                        ),
                        12.width,
                        const Icon(Icons.visibility_outlined, color: Color(0xFF9EA7B5), size: 18),
                        4.width,
                        CommonText(
                          text: views,
                          style: const TextStyle(color: Color(0xFF9EA7B5), fontSize: 14),
                        ),
                      ],
                    ),
                    12.height,
                    // Tags (Fantasy, Romance, etc.)
                    Wrap(spacing: 8, children: tags.map((tag) => _buildTag(tag)).toList()),
                  ],
                ),
              ),
            ],
          ),

          // 3. Rank Badge positioned in the top-right
          Positioned(
            right: 0,
            top: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '$rank',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CommonText(
        text: label,
        style: const TextStyle(color: Color(0xFF9136FF), fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
