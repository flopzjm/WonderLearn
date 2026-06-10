import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int stars;
  final int maxStars;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const StarRating({
    super.key,
    required this.stars,
    this.maxStars = 3,
    this.size = 24,
    this.activeColor = const Color(0xFFFFD93D),
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Icon(
            index < stars ? Icons.star : Icons.star_border,
            size: size,
            color: index < stars ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}
