import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NAScreen extends StatelessWidget {
  const NAScreen({
    required this.upperBody,
    required this.lowerBodyChild,
    super.key,
  });

  final Widget upperBody;
  final Widget lowerBodyChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        upperBody,
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: NAColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: NASpacing.s20),
          child: lowerBodyChild,
        ),
      ],
    );
  }
}
