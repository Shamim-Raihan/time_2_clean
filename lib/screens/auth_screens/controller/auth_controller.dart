import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var confirmPassController = TextEditingController().obs;
  var obscureText = true.obs;
  var confirmObscureText = true.obs;
  var isRemember = true.obs;
  var isAgree = true.obs;
}
