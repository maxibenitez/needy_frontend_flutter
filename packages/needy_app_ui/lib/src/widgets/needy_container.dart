import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NAContainer extends StatelessWidget {
  const NAContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: NAColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: NASpacing.s20),
      child: child,
    );
  }
}
