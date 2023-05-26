import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/needy/needy.dart';

class NeedyPage extends StatelessWidget {
  const NeedyPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const NeedyPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NeedyBloc(),
      child: const NeedyView(),
    );
  }
}
