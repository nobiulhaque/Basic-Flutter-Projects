import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconImagePath;
  final String categoryName;
  final bool isLastItem; // New parameter to identify last card

  const CategoryCard({
    super.key,
    required this.iconImagePath,
    required this.categoryName,
    this.isLastItem = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(// Reduced left padding
        right: isLastItem ? 25.0 : 25.0, // Right padding only for last item
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More compact
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Tightly wrap content
          children: [
            Image.asset(iconImagePath, height: 40), // Smaller image
            const SizedBox(width: 8), // Reduced spacing
            Text(
              categoryName,
              style: const TextStyle(fontSize: 14), // Smaller text
            ),
          ],
        ),
      ),
    );
  }
}