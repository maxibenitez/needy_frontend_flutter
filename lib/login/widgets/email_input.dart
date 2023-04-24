import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/login/login.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isEmailValid =
        context.select((LoginBloc bloc) => bloc.state.emailValid);
    final email = context.select((LoginBloc bloc) => bloc.state.email);

    return NATextField.emailTextField(
      onChanged: (value) {
        context.read<LoginBloc>().add(
              LoginEmailChanged(email: value),
            );
      },
      errorText: isEmailValid
          ? null
          : email.isEmpty
              ? "Ingrese su mail"
              : "Email no es válido",
    );
  }
}
