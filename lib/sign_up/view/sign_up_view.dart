import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        appBar: NAAppBar(
          widgetTitle: Text("Sign up", style: NATextStyle.caption),
        ),
        backgroundColor: NAColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "NEEDY",
              style: NATextStyle.display3
                  .copyWith(color: NAColors.white, fontSize: 80),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: NAColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: NASpacing.s20),
              child: ListView(
                children: [
                  const SizedBox(height: NASpacing.xlg),
                  const _NameTextFields(),
                  const CITextfield(),
                  const EmailTextField(),
                  const PasswordTextfield(),
                  const PhoneTextfield(),
                  const InstagramAccountTextfield(),
                  const AddressTextfield(),
                  const DateOfBirthTextField(),
                  GenderTextFieldDropDown(),
                  ZoneTextFieldDropDown(),
                  const SizedBox(height: NASpacing.xlg),
                  Align(
                    alignment: Alignment.center,
                    child: NAButton.primary(
                      onPressed: () {
                        context.read<SignUpBloc>().add(
                              const SignUpSubmitted(),
                            );
                      },
                      text: "Registrarse",
                    ),
                  ),
                ],
              ),
            ),
          ],
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
