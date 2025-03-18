import 'package:ecommerce_admin/core/Class/StatusRequest_Class.dart';
import 'package:ecommerce_admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:ecommerce_admin/core/Services/Services.dart';

import 'package:ecommerce_admin/data/DataSource/Remote/orders/orderspinding_data.dart';
import 'package:ecommerce_admin/data/model/Orders_model.dart';
import 'package:get/get.dart';

class BindingController extends GetxController {
  List<OrdersModel> data = [];
  OrdersPindingData bindingdata = OrdersPindingData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        print("nodata");
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  approveOrder(String ordersid, String usersid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.approveOrder(ordersid, usersid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        reFreshOrder();
        // List responsebody = response["data"];
        // data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        print("nodata");
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  reFreshOrder() {
    getData();
  }

  String printTypeOrder(String val) {
    if (val == "0") {
      return "ecommerce_admin";
    } else {
      return "Recicve";
    }
  }

  String printPaymantMethod(String val) {
    if (val == "0") {
      return "Cash On ecommerce_admin";
    } else {
      return "Paymant Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Appoval";
    } else if (val == "1") {
      return "The Order Is Beeing Prepared";
    } else if (val == "2") {
      return "The Order with ecommerce_admin";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  void onInit() {
    // print(
    //     "======${myServices.sharedPreferences.getString("id")!.isEmpty}==");
    getData();
    super.onInit();
  }
}
