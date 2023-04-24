import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';
import 'package:needy_frontend/login/login.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((LoginBloc bloc) => bloc.state.status);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: NAColors.white,
        appBar: NAAppBar(
          elevation: 0,
          backgroundColor: NAColors.oceanBlue,
          widgetTitle: Text(
            "Needy App",
            style: NATextStyle.headline3.copyWith(color: NAColors.white),
          ),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Error al iniciar sesión"),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            if (state.status == LoginStatus.success) {
              Navigator.of(context).pushAndRemoveUntil(
                HomePage.route(),
                (route) => false,
              );
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: NASpacing.s20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: NASpacing.xxxlg),
                      const EmailInput(),
                      const SizedBox(height: NASpacing.s20),
                      const PasswordInput(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text("Olvidaste tu contraseña?")),
                      ),
                      status == LoginStatus.loading
                          ? const CircularProgressIndicator()
                          : NAOutlinedButton.primary(
                              text: "Ingresar",
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                      const LoginSubmitted(),
                                    );
                              },
                            ),
                      const SizedBox(height: NASpacing.s20),
                      NAOutlinedButton.primary(
                        text: "Registrarse",
                        onPressed: () {
                          Navigator.of(context).push(SignUpPage.route());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
