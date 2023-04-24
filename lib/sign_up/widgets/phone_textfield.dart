import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class PhoneTextfield extends StatelessWidget {
  const PhoneTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NATextField(
      prefix: const Icon(Icons.phone),
      onChanged: (phoneNumber) {
        context.read<SignUpBloc>().add(
              SignUpPhoneChanged(
                phone: phoneNumber,
              ),
            );
      },
    );
  }
}
