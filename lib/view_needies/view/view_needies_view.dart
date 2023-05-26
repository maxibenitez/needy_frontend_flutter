import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/models/skill.dart';
import 'package:needy_frontend/needy/view/view.dart';
import 'package:needy_frontend/view_needies/view_needies.dart';

class ViewNeediesView extends StatelessWidget {
  const ViewNeediesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final needies =
        context.select((ViewNeediesBloc bloc) => bloc.state.skillsSuggested);

    return BlocListener<ViewNeediesBloc, ViewNeediesState>(
      listener: (context, state) {
        if (state.status == ViewNeediesStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: NAAppBar(
          widgetTitle: Text(
            "Search",
            style: NATextStyle.caption,
          ),
        ),
        body: Filter(needies: needies),
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({
    super.key,
    required this.needies,
  });

  final List<Skill> needies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            onChanged: (value) {
              context.read<ViewNeediesBloc>().add(
                    SearchNeedyChanged(value),
                  );
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: NAColors.primary, width: 3),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: NASpacing.md),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(NeedyPage.route());
                  },
                  child: NASmallContainer(
                      child: _NeedyInfo(needy: needies[index])),
                );
              },
              itemCount: needies.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _NeedyInfo extends StatelessWidget {
  const _NeedyInfo({
    required this.needy,
  });

  final Skill needy;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
              style:
                  NATextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold),
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
          ])
    ]);
  }
}
