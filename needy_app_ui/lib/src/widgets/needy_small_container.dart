import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NASmallContainer extends StatelessWidget {
  const NASmallContainer({
    required this.child,
    this.height,
    super.key,
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NAColors.primary,
      ),
      child: child,
    );
  }
}
