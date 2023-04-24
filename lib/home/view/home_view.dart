import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';

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
      child: Scaffold(
        appBar: NAAppBar(
          widgetTitle: Text("Inicio",
              style: NATextStyle.overline.copyWith(color: Colors.white)),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NAOutlinedButton.home(
                text: "Necesito Ayuda",
                onPressed: () {},
              ),
              const SizedBox(height: NASpacing.s30),
              NAOutlinedButton.home(
                text: "Quiero Ayudar",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
