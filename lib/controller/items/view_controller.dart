import 'package:ecommerce_admin/core/Constant/Routes_Const.dart';
import 'package:ecommerce_admin/data/DataSource/Remote/items_data.dart';
import 'package:ecommerce_admin/data/Model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:ecommerce_admin/core/Class/StatusRequest_Class.dart';
import 'package:ecommerce_admin/core/Functions/HandlingDataController_Functions.dart';

class ViewItemsController extends GetxController {
  ItemsData testData = ItemsData(Get.find());
  List<ItemsModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    update();
    var response = await testData.viewItems();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List databody = response["data"];
        data.addAll(databody.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  deleteData(int index) async {
    Map data1 = {"id": data[index].itemsId, "image": data[index].itemsImage};
    await testData.deleteItems(data1);
    data.removeWhere((element) => element.itemsId == data[index].itemsId);
    update();
  }

  goToEdit(ItemsModel itemsmodel) {
    Get.toNamed(AppRouts.itemedit,
        arguments: {"itemsmodel": itemsmodel, "catname": data});
  }

  myBack() {
    Get.offAllNamed(AppRouts.home);
    return Future.value(false);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
