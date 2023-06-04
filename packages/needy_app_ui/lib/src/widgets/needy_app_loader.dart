import 'package:flutter/material.dart';

class NALoader extends StatelessWidget {
  const NALoader({
    super.key,
    this.color = Colors.black,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
