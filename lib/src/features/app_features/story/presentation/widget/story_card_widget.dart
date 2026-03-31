import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/constants.dart';

class StoryCardWidget extends StatelessWidget {
  final String title;
  final String author;
  final String summary;
  final String? imageUrl;
  final String timeAgo;
  final double rating;
  final int chapters;
  final String views;

  const StoryCardWidget({
    super.key,
    this.title = 'Love in the Boardroom',
    this.author = 'Victoria Sterling',
    this.summary =
        'She was his assistant. He was her boss. But the lines between business and pleasure blur in this steamy romance.',
    this.imageUrl,
    this.timeAgo = '30 min ago',
    this.rating = 4.8,
    this.chapters = 5,
    this.views = '45K',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Book Cover Image
          CommonImage(
            src: imageUrl ?? Constants.sampleImage,
            width: 85,
            height: 110,
            enableAspectRatio: true,
            borderRadius: 16,
          ),
          const SizedBox(width: 16),

          // 2. Content Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Title and Time Ago
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1C1E),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Color(0xFF9EA7B5)),
                        const SizedBox(width: 4),
                        Text(
                          timeAgo,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF9EA7B5)),
                        ),
                      ],
                    ),
                  ],
                ),

                // Author Name
                Text(author, style: const TextStyle(fontSize: 14, color: Color(0xFF9EA7B5))),
                const SizedBox(height: 10),

                // Story Summary
                Text(
                  summary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, height: 1.3, color: Color(0xFF424242)),
                ),
                const SizedBox(height: 12),

                // Footer Metadata Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating & Chapters
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFD700), size: 18),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.menu_book_rounded, color: Color(0xFF9EA7B5), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$chapters chapters',
                          style: const TextStyle(color: Color(0xFF9EA7B5), fontSize: 13),
                        ),
                      ],
                    ),
                    // Views
                    Row(
                      children: [
                        const Icon(Icons.visibility_outlined, color: Color(0xFF9EA7B5), size: 16),
                        const SizedBox(width: 4),
                        Text(views, style: const TextStyle(color: Color(0xFF9EA7B5), fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
