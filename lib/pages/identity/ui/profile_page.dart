

import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/data/models/user_model.dart';
import 'package:rewardsplus_ecomm/widgets/bottomnav.dart';

class ProfilePage extends StatelessWidget {
  final User? user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyMainBottomNav(currentTabIndex: 1,),
        body: Center(child: Text("Profile Page of ${user?.name}"))
    );
  }
}
