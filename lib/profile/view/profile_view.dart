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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: NAColors.white,
                    width: 4,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    // needies[index].image,
                    "https://picsum.photos/200/300",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Carol Glass - 23",
                      style: NATextStyle.headline3
                          .copyWith(color: NAColors.primary),
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
                    Text(
                      "Difficulties",
                      style: NATextStyle.headline3
                          .copyWith(color: NAColors.primary, fontSize: 20),
                    ),
                    const SizedBox(
                      height: NASpacing.md,
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SquareCircleContainer extends StatelessWidget {
  const SquareCircleContainer({
    required this.title,
    required this.icon,
    super.key,
  });

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: NASpacing.s10),
      height: NASpacing.xxxlg,
      width: NASpacing.xxxlg,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(NASpacing.s10)),
        color: NAColors.brightGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
