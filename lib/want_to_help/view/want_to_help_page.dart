import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/want_to_help/want_to_help.dart';

class WantToHelpPage extends StatelessWidget {
  const WantToHelpPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const WantToHelpPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WantToHelpBloc(),
      child: const WantToHelpView(),
    );
  }
}
