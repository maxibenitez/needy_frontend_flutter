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
          appBar: NAAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: NAColors.primary,
          body: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NAPictureContainer(
                  src: "https://picsum.photos/200/300",
                ),
                NAContainer(
                  child: _ProfileInfo(),
                ),
              ],
            ),
          ),
        ));
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: NASpacing.s20,
        ),
        Text(
          "Carol Glass - 23",
          style: NATextStyle.headline3.copyWith(color: NAColors.primary),
        ),
        const SizedBox(
          height: NASpacing.md,
        ),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
          " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
        ),
        const SizedBox(
          height: NASpacing.md,
        ),
        Text(
          "Skills",
          style: NATextStyle.headline3
              .copyWith(color: NAColors.primary, fontSize: 20),
        ),
        const SizedBox(
          height: NASpacing.md,
        ),
        const Row(
          children: [
            SquareCircleContainer(
              title: "Cocina",
              icon: Icon(Icons.cookie),
            ),
            SizedBox(
              width: NASpacing.s10,
            ),
            SquareCircleContainer(
              title: "Tecnologia",
              icon: Icon(Icons.code),
            ),
            SizedBox(
              width: NASpacing.s10,
            ),
            SquareCircleContainer(
              title: "Cocina",
              icon: Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(
          height: NASpacing.md,
        ),
        Text(
          "Difficulties",
          style: NATextStyle.headline3
              .copyWith(color: NAColors.primary, fontSize: 20),
        ),
        const SizedBox(
          height: NASpacing.lg,
        ),
        const Row(
          children: [
            SquareCircleContainer(
              title: "Cargas pesadas",
              icon: Icon(Icons.line_weight_sharp),
            ),
            SizedBox(
              width: NASpacing.s10,
            ),
          ],
        ),
        const SizedBox(
          height: NASpacing.md,
        ),
        NAButton.primary(
          text: "Contact",
          onPressed: () {
            //TODO: Add contact functionality
          },
        )
      ],
    );
  }
}
