import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class MySkillsTab extends StatelessWidget {
  const MySkillsTab({super.key});

  @override
  Widget build(BuildContext context) {
    const squareHeight = 50.0;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SquareCircleContainer(
                title: "Cocina",
                icon: Icon(Icons.cookie),
                height: squareHeight,
              ),
              SizedBox(
                width: NASpacing.s10,
              ),
              SquareCircleContainer(
                title: "Tecnologia",
                icon: Icon(Icons.code),
                height: squareHeight,
              ),
              SizedBox(
                width: NASpacing.s10,
              ),
              SquareCircleContainer(
                title: "Cocina",
                icon: Icon(Icons.add),
                height: squareHeight,
              ),
            ],
          ),
          NAButton.primary(
            text: "Add Need",
            onPressed: () {
              //TODO: Implement this
            },
          ),
        ],
      ),
    );
  }
}
