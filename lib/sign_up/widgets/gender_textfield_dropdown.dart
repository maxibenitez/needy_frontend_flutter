import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class GenderTextFieldDropDown extends StatelessWidget {
  GenderTextFieldDropDown({super.key});

  final List<String> _genderOptions = [
    'Male',
    'Female',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    final selectedGender =
        context.select((SignUpBloc bloc) => bloc.state.gender);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: NATextStyle.bodyText1),
        DropdownButton(
          hint: const Text('Selecciona un género'),
          value: selectedGender,
          underline: Container(
            height: 1,
            color: NAColors.grey,
          ),
          onChanged: (gender) {
            context
                .read<SignUpBloc>()
                .add(SignUpGenderChanged(gender: gender!));
          },
          items: _genderOptions.map((gender) {
            return DropdownMenuItem(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        ),
      ],
    );
  }
}
