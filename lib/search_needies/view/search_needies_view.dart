import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';
import 'package:needy_frontend/models/models.dart';
import 'package:needy_frontend/needy/view/view.dart';
import 'package:needy_frontend/search_needies/search_needies.dart';

class SearchNeediesView extends StatelessWidget {
  const SearchNeediesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final needies =
        context.select((SearchNeediesBloc bloc) => bloc.state.neediesSuggested);

    return BlocListener<SearchNeediesBloc, SearchNeediesState>(
      listener: (context, state) {
        if (state.status == SearchNeediesStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Error al cargar los datos"),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
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

  final List<Need> needies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            onChanged: (value) {
              context.read<SearchNeediesBloc>().add(
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
                  child:
                      NASmallContainer(child: NeedyInfo(needy: needies[index])),
                );
              },
              itemCount: needies.length,
            ),
          ),
        ),
        const BottomIconsRow(
          iconColor: NAColors.primary,
        ),
      ],
    );
  }
}
