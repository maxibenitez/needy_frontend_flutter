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

    return BlocListener<LoginBloc, LoginState>(
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
      child: Scaffold(
        backgroundColor: NAColors.primary,
        appBar: NAAppBar(
          widgetTitle: Text("Login", style: NATextStyle.caption),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "NEEDY",
              style: NATextStyle.display3
                  .copyWith(color: NAColors.white, fontSize: 100),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: NAColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: NASpacing.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: NASpacing.s20),
                  const EmailInput(),
                  const SizedBox(height: NASpacing.s20),
                  const PasswordInput(),
                  status == LoginStatus.loading
                      ? const CircularProgressIndicator()
                      : NAButton.primary(
                          text: "Ingresar",
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  const LoginSubmitted(),
                                );
                          },
                        ),
                  const SizedBox(height: NASpacing.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("No tienes una cuenta?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(SignUpPage.route());
                          },
                          child: const Text("Registrate")),
                    ],
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
