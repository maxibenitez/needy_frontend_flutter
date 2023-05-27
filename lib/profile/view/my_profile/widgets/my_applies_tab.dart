import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/profile/profile.dart';

class MyAppliesTab extends StatelessWidget {
  const MyAppliesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final myApplies =
        context.select((ProfileBloc bloc) => bloc.state.myApplies);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: NASpacing.md, vertical: NASpacing.s50),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            final needy = myApplies[index];

            return NASmallContainer(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      // needies[index].image,
                      "https://picsum.photos/200/300",
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            needy.name,
                            style: NATextStyle.subtitle1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // needies[index].location,
                            "Location: Parque Batlle",
                            style: NATextStyle.subtitle2,
                          ),
                          Text(
                            // needies[index].description,
                            "Date: 12/12/2021",
                            style: NATextStyle.subtitle2,
                          ),
                        ]),
                    IconButton(
                        onPressed: () {
                          //TODO: Implement this
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: NAColors.white,
                        )),
                  ]),
            );
          },
          itemCount: myApplies.length,
        ),
      ),
    );
  }
}
