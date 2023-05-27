import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/search_needies/search_needies.dart';

class SearchNeediesPage extends StatelessWidget {
  const SearchNeediesPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const SearchNeediesPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchNeediesBloc()..add(const ViewNeediesEventStarted()),
      child: const SearchNeediesView(),
    );
  }
}
