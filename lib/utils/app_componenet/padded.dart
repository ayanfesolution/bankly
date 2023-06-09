import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';

class Padded extends StatelessWidget {
  const Padded({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: autoAdjustWidth(16),
      ),
      child: child,
    );
  }
}
