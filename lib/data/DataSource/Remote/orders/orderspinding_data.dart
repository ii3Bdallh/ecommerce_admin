import 'package:ecommerce_admin/core/Class/CRUD_Class.dart';
import 'package:ecommerce_admin/linkapi.dart';

class OrdersPindingData {
  Crud crud;
  OrdersPindingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.pindingvieworder, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String ordersid, String usersid) async {
    var response = await crud.postData(AppLink.approveorders, {
      "ordersid": ordersid,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
