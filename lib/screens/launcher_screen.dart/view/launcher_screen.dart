import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:time_2_clean/screens/launcher_screen.dart/controller.dart/launcher_controller.dart';

class LauncherScreen extends StatelessWidget {
  LauncherScreen({super.key});

  final LauncherContoroller launcherContoroller =
      Get.put(LauncherContoroller());

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
