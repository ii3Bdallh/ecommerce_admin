// import 'package:ecommerce_admin/controller/home_controller.dart';
// import 'package:ecommerce_admin/core/constant/color.dart';
// import 'package:ecommerce_admin/data/model/itemsmodel.dart';
// import 'package:ecommerce_admin/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ListItemsHome extends GetView<HomeControllerImp> {
//   const ListItemsHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 140,
//       child: ListView.builder(
//           itemCount: controller.items.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, i) {
//             return ItemsHome(
//                 itemsModel: ItemsModel.fromJson(controller.items[i]));
//           }),
//     );
//   }
// }

// class ItemsHome extends GetView<HomeControllerImp> {
//   final ItemsModel itemsModel;
//   const ItemsHome({super.key, required this.itemsModel});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToPageProductDetails(itemsModel);
//         print("================================================");
//         print(itemsModel.itemsPrice);
//         print(itemsModel.itemsDiscount);
//         print("================================================");
//       },
//       child: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             child: Image.network(
//               "${AppLink.imagestItems}/${itemsModel.itemsImage}",
//               height: 100,
//               width: 150,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 color: AppColor.black.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(20)),
//             height: 120,
//             width: 200,
//           ),
//           Positioned(
//               left: 10,
//               child: Text(
//                 "${itemsModel.itemsName}",
//                 style: const TextStyle(
//                     color: Colors.white,
//                     // fontWeight: FontWeight.bold,
//                     fontSize: 14),
//               ))
//         ],
//       ),
//     );
//   }
// }
