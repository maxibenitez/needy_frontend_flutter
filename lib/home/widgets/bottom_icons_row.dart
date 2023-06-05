import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/home/home.dart';
import 'package:needy_frontend/profile/profile.dart';
import 'package:needy_frontend/search_needies/search_needies.dart';

class BottomIconsRow extends StatelessWidget {
  const BottomIconsRow({
    this.iconColor,
    super.key,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(HomePage.route());
            },
            icon: const Icon(Icons.home),
            iconSize: 50,
            color: iconColor ?? NAColors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(SearchNeediesPage.route());
            },
            icon: const Icon(Icons.search),
            iconSize: 50,
            color: iconColor ?? NAColors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MyProfilePage.route());
            },
            icon: const Icon(Icons.person),
            iconSize: 50,
            color: iconColor ?? NAColors.white,
          ),
        ],
      ),
    );
  }
}
