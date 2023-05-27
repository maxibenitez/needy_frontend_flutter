import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/models/models.dart';

class NeedyInfo extends StatelessWidget {
  const NeedyInfo({
    super.key,
    required this.needy,
  });

  final Skill needy;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Image.network(
        // needies[index].image,
        "https://picsum.photos/200/300",
        width: 50,
        height: 50,
        fit: BoxFit.fill,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              needy.name,
              style:
                  NATextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              // needies[index].location,
              "Location: Parque Batlle",
              style: NATextStyle.subtitle2,
            ),
            Text(
              // needies[index].description,
              "Date: 12/12/2021",
              style: NATextStyle.subtitle2,
            ),
          ])
    ]);
  }
}
