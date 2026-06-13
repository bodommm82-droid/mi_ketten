import 'package:flutter/material.dart';

class AppAnimations {
  static Widget fadeIn({
    required Widget child,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      builder: (_, value, __) => Opacity(opacity: value, child: child),
    );
  }

  static Widget slideUp({
    required Widget child,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: const Offset(0, 0.2), end: Offset.zero),
      duration: duration,
      builder: (_, value, __) =>
          Transform.translate(offset: value, child: child),
    );
  }
}
