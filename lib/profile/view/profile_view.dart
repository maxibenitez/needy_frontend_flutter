import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/profile/profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.error) {
            // Handle Error
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          appBar: const NAAppBar(),
          backgroundColor: NAColors.white,
          body: Container(),
        ));
  }
}
