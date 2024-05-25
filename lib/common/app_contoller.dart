import 'package:get/get.dart';

class AppContoller extends GetxController {
  var selectedBottomItem = 0.obs;

 onItemTapped(int index) {
    selectedBottomItem.value = index;
  }
}
