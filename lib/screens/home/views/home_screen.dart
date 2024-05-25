import 'package:flutter/material.dart';
import 'package:time_2_clean/global_widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Home screen'),),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
         