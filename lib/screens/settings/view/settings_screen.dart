import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/global_widgets/bottom_nav_bar.dart';
import 'package:time_2_clean/screens/profile/view/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Get.to(()=> const ProfileScreen(), transition: Transition.rightToLeft);
          },
          child: const Text('settings screen'),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
