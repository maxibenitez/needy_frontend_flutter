import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/skills/skills.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const SkillsPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SkillsBloc(),
      child: const SkillsView(),
    );
  }
}
