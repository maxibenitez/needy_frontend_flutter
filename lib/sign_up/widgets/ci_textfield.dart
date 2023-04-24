import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class CITextfield extends StatelessWidget {
  const CITextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NATextField(
      hintText: "Documento (sin puntos ni guiones)",
      onChanged: (cedula) {
        context.read<SignUpBloc>().add(SignUpIdChanged(id: cedula));
      },
    );
  }
}
