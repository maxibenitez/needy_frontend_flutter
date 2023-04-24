import 'package:flutter/material.dart';
import 'package:needy_frontend/login/login.dart';

void main() => runApp(const NeedyApp());

class NeedyApp extends StatelessWidget {
  const NeedyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Needy App',
      home: LoginPage(),
    );
  }
}
