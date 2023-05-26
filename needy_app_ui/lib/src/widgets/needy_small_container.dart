import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NASmallContainer extends StatelessWidget {
  const NASmallContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NAColors.primary,
      ),
      child: child,
    );
  }
}
