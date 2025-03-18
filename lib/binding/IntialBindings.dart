import 'package:get/get.dart';
import 'package:ecommerce_admin/core/Class/CRUD_Class.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
