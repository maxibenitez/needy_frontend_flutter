import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/profile/profile.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const RatingPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const RatingView(),
    );
  }
}
