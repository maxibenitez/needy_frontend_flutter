import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/profile/profile.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.status == ProfileStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: NAAppBar.common(
          title: "Profile",
          context: context,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const NAPictureContainer(
              src: "https://picsum.photos/200/300",
            ),
            const Text("CAROL GLASS"),
            TabBar(
              controller: _tabController,
              labelColor: NAColors.primary,
              indicatorColor: NAColors.primary,
              tabs: const [
                Tab(text: 'My Needs'),
                Tab(text: 'My Applies'),
                Tab(text: 'My Skills'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  MyNeedsTab(),
                  MyAppliesTab(),
                  MySkillsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
