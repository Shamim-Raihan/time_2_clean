import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var obscureText = true.obs;
  var checkedbox = true.obs;
}
