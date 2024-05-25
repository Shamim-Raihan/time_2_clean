import 'package:flutter/material.dart';

import '../../../global_widgets/bottom_nav_bar.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
        child: Text('chat list screen'),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
