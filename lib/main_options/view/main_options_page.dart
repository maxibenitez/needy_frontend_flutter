import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/main_options/main_options.dart';

class MainOptionsPage extends StatelessWidget {
  const MainOptionsPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const MainOptionsPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainOptionsBloc(),
      child: const MainOptionsView(),
    );
  }
}
