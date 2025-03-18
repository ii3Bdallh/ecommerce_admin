import 'package:get/get.dart';
import 'package:ecommerce_admin/core/Constant/Routes_Const.dart';

class SignUpSuccessController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRouts.logIn);
  }
}
