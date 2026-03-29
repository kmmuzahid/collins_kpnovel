import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';

class ActionBarWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  const ActionBarWidget({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24), // Adjust for desired roundness
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionItem(Icons.volume_up_outlined, AppString.listen, iconColor, textColor),
          _buildActionItem(Icons.bookmark_add_outlined, AppString.bookmark, iconColor, textColor),
          _buildActionItem(Icons.chat_bubble_outline, AppString.comment, iconColor, textColor),
          _buildActionItem(Icons.share_outlined, AppString.share, iconColor, textColor),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label, Color iconColor, Color textColor) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
