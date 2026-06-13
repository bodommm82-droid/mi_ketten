import 'package:flutter/material.dart';

class AnimatedAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const AnimatedAvatar({
    super.key,
    required this.imageUrl,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 300),
      scale: 1.05,
      child: CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
