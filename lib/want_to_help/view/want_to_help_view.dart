import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/want_to_help/want_to_help.dart';

class WantToHelpView extends StatelessWidget {
  const WantToHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WantToHelpBloc, WantToHelpState>(
      listener: (context, state) {
        if (state.status == WantToHelpStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: NAColors.primary,
        appBar: const NAAppBar(),
        body: Column(children: [
          Text(
            "Indique su servicio",
            style: NATextStyle.headline3.copyWith(fontSize: 20),
          )
        ]),
      ),
    );
  }
}
