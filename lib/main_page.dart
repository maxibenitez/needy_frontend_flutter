import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/login/login.dart';
import 'package:needy_frontend/sign_up/view/sign_up_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const MainPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NAColors.primary,
      body: Align(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "NEEDY",
            style: NATextStyle.display3
                .copyWith(color: NAColors.white, fontSize: 100),
          ),
          const SizedBox(height: 150),
          NAButton.secondary(
            text: "Login",
            onPressed: () {
              Navigator.of(context).push(LoginPage.route());
            },
          ),
          const SizedBox(height: 20),
          Text(
            "---------------------",
            style: NATextStyle.subtitle1.copyWith(color: NAColors.white),
          ),
          const SizedBox(height: 20),
          NAButton.tertiary(
            text: "Sign up",
            onPressed: () {
              Navigator.of(context).push(SignUpPage.route());
            },
          )
        ]),
      ),
    );
  }
}
