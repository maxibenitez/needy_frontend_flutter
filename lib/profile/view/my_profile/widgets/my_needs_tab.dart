import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/profile/profile.dart';

class MyNeedsTab extends StatelessWidget {
  const MyNeedsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final myNeeds = context.select((ProfileBloc bloc) => bloc.state.myNeeds);

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: NASpacing.md, vertical: NASpacing.md),
          child: ListView(
            children: [
              ...myNeeds.map(
                (need) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: NASmallContainer(
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
                                  need.name,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: NASpacing.s50),
                child: NAButton.primary(
                  text: "Add Need",
                  onPressed: () {
                    //TODO: Implement this
                  },
                ),
              ),
            ],
          )),
    );
  }
}
