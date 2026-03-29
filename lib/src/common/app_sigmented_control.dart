import 'package:core_kit/text/common_text.dart';
import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:flutter/material.dart';

class AppSegmentedControl<T> extends StatelessWidget {
  final List<T> items;
  final T selected;
  final ValueChanged<T> onChanged;

  final String Function(T item) labelBuilder;
  final IconData? Function(T item)? iconBuilder;

  // colors
  final Color backgroundColor;
  final Color borderColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const AppSegmentedControl({
    super.key,
    required this.items,
    required this.selected,
    required this.onChanged,
    required this.labelBuilder,
    this.iconBuilder,

    required this.backgroundColor,
    required this.borderColor,
    required this.selectedItemColor,
    this.unselectedItemColor = Colors.transparent,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Row(
        children: items
            .map(
              (item) => _SegmentItem<T>(
                isSelected: item == selected,
                onTap: () => onChanged(item),
                label: labelBuilder(item),
                icon: iconBuilder?.call(item),

                selectedItemColor: selectedItemColor,
                unselectedItemColor: unselectedItemColor,
                selectedTextColor: selectedTextColor,
                unselectedTextColor: unselectedTextColor,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SegmentItem<T> extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final IconData? icon;

  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const _SegmentItem({
    required this.isSelected,
    required this.onTap,
    required this.label,
    this.icon,

    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 18.r;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? selectedItemColor : unselectedItemColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: Center(
            child: CommonText(
              left: 10,
              right: 10,
              top: 8,
              bottom: 8,
              preffix: icon != null
                  ? Icon(
                      icon,
                      size: 16,
                      color: isSelected ? selectedTextColor : unselectedTextColor,
                    )
                  : null,
              text: label,
              textColor: isSelected ? selectedTextColor : unselectedTextColor,
              fontSize: 14,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
    );
  }
}
