import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/utils/utils.dart';

class BirthDateWidget extends StatelessWidget {
  const BirthDateWidget({
    required this.initialDate,
    required this.isBirthDateValid,
    required this.formattedBirthdate,
    required this.onDateTimeChanged,
    super.key,
  });
  final DateTime initialDate;
  final bool isBirthDateValid;
  final String formattedBirthdate;
  final void Function(DateTime) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            DateHelper.showBirthdayPicker(
              context: context,
              initialDate: initialDate,
              onDateTimeChanged: onDateTimeChanged,
            );
          },
          child: Container(
            height: NASpacing.s50,
            padding: const EdgeInsets.symmetric(
                horizontal: NASpacing.sm, vertical: NASpacing.sm),
            decoration: BoxDecoration(
              border: isBirthDateValid
                  ? Border.all(color: NAColors.grey)
                  : Border.all(color: NAColors.red),
              borderRadius: BorderRadius.circular(NASpacing.xs),
            ),
            child: Text(formattedBirthdate,
                style: NATextStyle.subtitle1.copyWith(color: NAColors.black)),
          ),
        ),
        if (!isBirthDateValid)
          Padding(
            padding: const EdgeInsets.all(NASpacing.md),
            child: Text(
              "Selecciona fecha de nacimiento",
              style: NATextStyle.subtitle1.copyWith(color: NAColors.red),
            ),
          )
      ],
    );
  }
}
