import 'package:ecommerce_admin/core/Class/CRUD_Class.dart';
import 'package:ecommerce_admin/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.server, {});
    return response.fold((l) => l, (r) => r);
  }
}
