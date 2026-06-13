import 'package:flutter/material.dart';

class OfflineBanner extends StatelessWidget {
  final bool offline;

  const OfflineBanner({super.key, required this.offline});

  @override
  Widget build(BuildContext context) {
    if (!offline) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.red.shade400,
      child: const Text(
        'Offline mód – egyes funkciók nem elérhetők',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
