import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_admin/core/Class/CRUD_Class.dart';
import 'package:ecommerce_admin/core/Class/StatusRequest_Class.dart';
import 'package:ecommerce_admin/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  viewCategories() async {
    var response = await crud.postData(AppLink.catview, {});
    return response.fold((l) => l, (r) => r);
  }

  addCategories(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.catadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editCategories(Map data, [File? file]) async {
    Either<StatusRequest, Map> response;
    if (file == null) {
      response = await crud.postData(AppLink.catedit, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.catedit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteCategories(Map data) async {
    var response = await crud.postData(AppLink.catdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
