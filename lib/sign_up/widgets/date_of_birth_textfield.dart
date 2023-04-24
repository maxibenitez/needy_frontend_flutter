import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';
import 'package:needy_frontend/utils/utils.dart';

class DateOfBirthTextField extends StatelessWidget {
  const DateOfBirthTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((SignUpBloc bloc) => bloc.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fecha de nacimiento",
          style: NATextStyle.bodyText1,
        ),
        const SizedBox(height: NASpacing.lg),
        BirthDateWidget(
          initialDate: state.birthDate,
          formattedBirthdate: DateHelper.getFormattedBirthDate(
            birthDate: state.birthDate,
          ),
          isBirthDateValid: true,
          onDateTimeChanged: (birthDate) {
            context.read<SignUpBloc>().add(
                  SignUpBirthDateChanged(birthDate: birthDate),
                );
          },
        ),
      ],
    );
  }
}
