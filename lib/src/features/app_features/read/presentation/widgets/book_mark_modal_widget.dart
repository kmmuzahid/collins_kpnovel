import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';

class BookmarkModalWidget extends StatefulWidget {
  const BookmarkModalWidget({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<BookmarkModalWidget> createState() => _BookmarkModalWidgetState();
}

class _BookmarkModalWidgetState extends State<BookmarkModalWidget> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: ListView(
        controller: widget.scrollController,
        children: [ 
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 2. Header
          Row(
            children: [
              const Icon(Icons.bookmark_border_rounded, size: 24),
              const SizedBox(width: 8),
              Text(
                AppString.bookmark,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Text(
            'Chapter 2: Awakening Powers',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 24),

          // 3. Selection List
          _buildBookmarkOption(
            title: AppString.Favorites,
            subtitle: '12 ${AppString.chapters}',
            icon: Icons.star_rounded,
            iconBg: Colors.orange,
            index: 0,
          ),
          const SizedBox(height: 12),
          _buildBookmarkOption(
            title: AppString.Want_to_Read,
            subtitle: '8 ${AppString.chapters}',
            icon: Icons.library_books_rounded,
            iconBg: Colors.blue,
            index: 1,
          ),
          const SizedBox(height: 32),

          // 4. Done Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6236FF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                elevation: 0,
              ),
              child: Text(
                AppString.Done,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16), // Bottom safe area
        ],
      ),
    );
  }

  Widget _buildBookmarkOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required int index,
  }) {
    final isSelected = selectedOption == index;

    return GestureDetector(
      onTap: () => setState(() => selectedOption = index),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF6236FF) : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // Styled Icon Box
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBg.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconBg, size: 24),
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            // Checkbox indicator
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF6236FF) : Colors.transparent,
                border: Border.all(
                  color: isSelected ? const Color(0xFF6236FF) : Colors.grey.shade300,
                ),
              ),
              child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
            ),
          ],
        ),
      ),
    );
  }
}
