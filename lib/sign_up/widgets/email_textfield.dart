import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NATextField.emailTextField(
      onChanged: (email) {
        context.read<SignUpBloc>().add(
              SignUpEmailChanged(
                email: email,
              ),
            );
      },
    );
  }
}
