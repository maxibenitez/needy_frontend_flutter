import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class InstagramAccountTextfield extends StatelessWidget {
  const InstagramAccountTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NATextField(
      hintText: "Cuenta de instagram",
      onChanged: (instagram) {
        context.read<SignUpBloc>().add(
              SignUpIgAccountChanged(
                igAccount: instagram,
              ),
            );
      },
    );
  }
}
