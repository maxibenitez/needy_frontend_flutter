import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NeedHelpHomePage extends StatelessWidget {
  const NeedHelpHomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const NeedHelpHomePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NeedHelpHomeView();
  }
}

class NeedHelpHomeView extends StatelessWidget {
  const NeedHelpHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NAColors.white,
      appBar: const NAAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: NASpacing.xxxlg),
            NAButton.primary(
              text: "Ver personas",
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Text(
              "---------------------",
              style: NATextStyle.subtitle1.copyWith(color: NAColors.white),
            ),
            const SizedBox(height: 10),
            NAButton.primary(
              text: "Ver servicios",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
