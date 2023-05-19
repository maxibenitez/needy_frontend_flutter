import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/view_needies/view_needies.dart';

class ViewNeediesPage extends StatelessWidget {
  const ViewNeediesPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const ViewNeediesPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ViewNeediesBloc()..add(const ViewNeediesEventStarted()),
      child: const ViewNeediesView(),
    );
  }
}
