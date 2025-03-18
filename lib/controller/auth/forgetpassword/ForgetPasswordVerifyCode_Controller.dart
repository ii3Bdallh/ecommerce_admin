import 'package:get/get.dart';
import 'package:ecommerce_admin/core/Class/StatusRequest_Class.dart';
import 'package:ecommerce_admin/core/Constant/Routes_Const.dart';
import 'package:ecommerce_admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:ecommerce_admin/data/DataSource/Remote/forgetpassword_data/forgetCode_data.dart';

class ForgetPasswordVerifyCodeController extends GetxController {
  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  VerfiyCodeForgetPassData verfiyCodeForgetPassdata =
      VerfiyCodeForgetPassData(Get.find());
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  goToChangePassword(String code1) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeForgetPassdata.checkData(email, code1);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("==============${response["status"]}================");
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar("Success", "Correct Verification Code");
        Get.offNamed(AppRouts.changePassword, arguments: {"email": email});
      } else {
        print("==============${response["status"]}================");
        Get.snackbar("Failure", "inCorrect Verification Code");
      }
    }
    update();
  }
}
