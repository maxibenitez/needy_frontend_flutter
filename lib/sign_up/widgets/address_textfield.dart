import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class AddressTextfield extends StatelessWidget {
  const AddressTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NATextField(
      hintText: "Dirección",
      onChanged: (address) {
        context.read<SignUpBloc>().add(
              SignUpAddressChanged(
                address: address,
              ),
            );
      },
    );
  }
}
