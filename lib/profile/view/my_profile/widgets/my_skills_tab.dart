import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class MySkillsTab extends StatelessWidget {
  const MySkillsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          SquareCircleContainer(
            title: "Cocina",
            icon: Icon(Icons.cookie),
          ),
          SizedBox(
            width: NASpacing.s10,
          ),
          SquareCircleContainer(
            title: "Tecnologia",
            icon: Icon(Icons.code),
          ),
          SizedBox(
            width: NASpacing.s10,
          ),
          SquareCircleContainer(
            title: "Cocina",
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
