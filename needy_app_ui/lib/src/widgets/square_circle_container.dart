import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class SquareCircleContainer extends StatelessWidget {
  const SquareCircleContainer({
    required this.title,
    required this.icon,
    this.height,
    super.key,
  });

  final String title;
  final Widget icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(NASpacing.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(NASpacing.s10)),
        border: Border.all(color: NAColors.primary),
      ),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(
            title,
            style: NATextStyle.button
                .copyWith(color: NAColors.black, fontSize: 10),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
