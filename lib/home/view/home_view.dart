import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';
import 'package:needy_frontend/home/widgets/widgets.dart';
import 'package:needy_frontend/skills/skills.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: const Scaffold(
        backgroundColor: NAColors.primary,
        appBar: NAAppBar(),
        body: WelcomeToNeedyPage(),
      ),
    );
  }
}

class WelcomeToNeedyPage extends StatelessWidget {
  const WelcomeToNeedyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 90),
          Text(
            "Welcome to Needy!",
            style: NATextStyle.headline3.copyWith(fontSize: 20),
            softWrap: true,
          ),
          const SizedBox(height: NASpacing.xxxlg),
          NAButton.secondary(
            text: "Necesito Ayuda",
            onPressed: () {
              Navigator.of(context).push(NeedHelpHomePage.route());
            },
          ),
          const SizedBox(height: 10),
          Text(
            "---------------------",
            style: NATextStyle.subtitle1.copyWith(color: NAColors.white),
          ),
          const SizedBox(height: 10),
          NAButton.secondary(
            text: "Quiero Ayudar",
            onPressed: () {
              Navigator.of(context).push(SkillsPage.route());
            },
          ),
          const Spacer(),
          const BottomIconsRow()
        ],
      ),
    );
  }
}
