import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: NASpacing.s20);

    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == SignUpStatus.success) {
          Navigator.of(context).pushAndRemoveUntil(
            HomePage.route(),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: const NAAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: NASpacing.s20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: NASpacing.xlg),
                const _NameTextFields(),
                const CITextfield(),
                const EmailTextField(),
                separator,
                const PasswordTextfield(),
                separator,
                const PhoneTextfield(),
                separator,
                const InstagramAccountTextfield(),
                separator,
                const AddressTextfield(),
                separator,
                const DateOfBirthTextField(),
                separator,
                GenderTextFieldDropDown(),
                separator,
                ZoneTextFieldDropDown(),
                const SizedBox(height: NASpacing.xlg),
                Align(
                  alignment: Alignment.center,
                  child: NAOutlinedButton.primary(
                    onPressed: () {
                      context.read<SignUpBloc>().add(
                            const SignUpSubmitted(),
                          );
                    },
                    text: "Registrarse",
                  ),
                ),
                const SizedBox(height: NASpacing.s50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameTextFields extends StatelessWidget {
  const _NameTextFields();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NATextField(
            hintText: "Nombre",
            onChanged: (name) {
              context.read<SignUpBloc>().add(
                    SignUpNameChanged(
                      name: name,
                    ),
                  );
            },
          ),
        ),
        const SizedBox(width: NASpacing.s20),

        // Last Name TextField
        Expanded(
          child: NATextField(
            hintText: "Apellido",
            onChanged: (lastName) {
              context.read<SignUpBloc>().add(
                    SignUpLastNameChanged(
                      lastName: lastName,
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
