import 'package:flutter/material.dart';
import 'package:hmarishadi/core/constants/app_colors.dart';

class SelectionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey,
            width: 1.5,
          ),
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
