import 'package:ecommerce_admin/controller/orders/pinding_controller.dart';
import 'package:ecommerce_admin/core/Class/HandlingDataView_Class.dart';
import 'package:ecommerce_admin/view/widget/orders/orderslistcardbinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BendingOrders extends StatelessWidget {
  const BendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BindingController());

    return Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<BindingController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CardOrderList(
                      model: controller.data[index],
                    );
                  },
                ))));
  }
}
