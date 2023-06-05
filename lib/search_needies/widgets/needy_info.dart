import 'package:api_repository/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NeedyInfo extends StatelessWidget {
  const NeedyInfo({
    super.key,
    required this.needy,
  });

  final Need needy;

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
              needy.requestedSkill.name,
              style:
                  NATextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              // needies[index].description,
              "Date: ${DateFormat('yyyy-MM-dd').format(needy.creationDate)}",
              style: NATextStyle.subtitle2,
            ),
          ])
    ]);
  }
}
