import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/login/login.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordValid = context.select(
      (LoginBloc bloc) => bloc.state.passwordValid,
    );
    final obscurePasswordText = context.select(
      (LoginBloc bloc) => bloc.state.obscurePasswordText,
    );

    final password = context.select(
      (LoginBloc bloc) => bloc.state.password,
    );

    return NATextField.passwordTextField(
      suffix: IconButton(
        onPressed: () {
          context.read<LoginBloc>().add(
                LoginPasswordObscured(
                  passwordObscured: !obscurePasswordText,
                ),
              );
        },
        icon: Icon(
          obscurePasswordText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: NAColors.grey,
        ),
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password: value));
      },
      errorText: isPasswordValid
          ? null
          : password.isEmpty
              ? "Ingrese su contraseña"
              : "Contraseña no es válida",
      obscureText: obscurePasswordText,
    );
  }
}
