import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:time_2_clean/screens/auth_screens/views/sign_in_screen.dart';

class LauncherContoroller extends GetxController {
  @override
  void onInit() {
    checkUser();
    super.onInit();
  }

  checkUser() {
    Get.to(() => SignInScreen());
  }
}
