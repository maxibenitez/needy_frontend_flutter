import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/profile/profile.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

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
                  child: NASmallContainer(
                    child: Text("Carol Glass"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
