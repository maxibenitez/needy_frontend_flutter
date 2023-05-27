import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/main_options/main_options.dart';
import 'package:needy_frontend/search_needies/search_needies.dart';

class MainOptionsView extends StatelessWidget {
  const MainOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainOptionsBloc, MainOptionsState>(
      listener: (context, state) {
        if (state.status == MainOptionsStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: NAColors.primary,
        appBar: const NAAppBar(),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: NASpacing.s50 * 2),
              NAButton.secondary(
                text: "Ver personas",
                onPressed: () {
                  //TODO: Implement this
                },
              ),
              const SizedBox(height: 10),
              Text(
                "---------------------",
                style: NATextStyle.subtitle1.copyWith(color: NAColors.white),
              ),
              const SizedBox(height: 10),
              NAButton.secondary(
                text: "Ver necesidades",
                onPressed: () {
                  Navigator.of(context).push(SearchNeediesPage.route());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
