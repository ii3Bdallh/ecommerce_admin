import 'package:ecommerce_admin/core/Class/CRUD_Class.dart';
import 'package:ecommerce_admin/linkapi.dart';

class ChangePasswordData {
  Crud crud;
  ChangePasswordData(this.crud);
  updateData(String email, String password) async {
    var response = await crud.postData(
        AppLink.changepassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
