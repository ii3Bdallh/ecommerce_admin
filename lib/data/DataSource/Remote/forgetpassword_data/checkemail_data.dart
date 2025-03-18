import 'package:ecommerce_admin/core/Class/CRUD_Class.dart';
import 'package:ecommerce_admin/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  CheckData(String email) async {
    var response = await crud.postData(AppLink.checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
