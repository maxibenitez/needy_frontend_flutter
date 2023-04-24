import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NATextField(
      hintText: "Contraseña",
      onChanged: (password) {
        context.read<SignUpBloc>().add(
              SignUpPasswordChanged(
                password: password,
              ),
            );
      },
    );
  }
}
