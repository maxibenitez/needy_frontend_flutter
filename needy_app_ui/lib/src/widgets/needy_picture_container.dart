import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NAPictureContainer extends StatelessWidget {
  const NAPictureContainer({this.src, this.noPhotoWidget, super.key});

  final Widget? noPhotoWidget;
  final String? src;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(NASpacing.s20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: NAColors.white,
          width: 4,
        ),
      ),
      child: ClipOval(
        child: noPhotoWidget ??
            Image.network(
              // needies[index].image,
              src ?? "",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}
