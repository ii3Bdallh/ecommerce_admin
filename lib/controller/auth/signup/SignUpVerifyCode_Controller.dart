import 'package:get/get.dart';
import 'package:ecommerce_admin/core/Class/StatusRequest_Class.dart';
import 'package:ecommerce_admin/core/Constant/Routes_Const.dart';
import 'package:ecommerce_admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:ecommerce_admin/data/DataSource/Remote/signUpCode_data.dart';

class SignUpVerifyCodeController extends GetxController {
  int? code;
  late StatusRequest statusRequest;
  String? email;
  VerfiyCodeSignUpData signUpData = VerfiyCodeSignUpData(Get.find());
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  goToSuccessSignUp(String code1) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await signUpData.checkData(email!, code1);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRouts.successSignUp);
      } else {
        Get.snackbar("Failure", "Incorrect Verification Code");
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  reSendCode() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await signUpData.resendData(email!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    }
    update();
  }
}
