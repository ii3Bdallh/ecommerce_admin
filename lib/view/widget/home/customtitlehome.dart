import 'package:ecommerce_admin/core/Constant/Color_Const.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
