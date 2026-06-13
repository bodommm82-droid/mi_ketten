import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String label;
  final IconData icon;

  const BadgeWidget({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      backgroundColor: Colors.purple.shade100,
    );
  }
}
