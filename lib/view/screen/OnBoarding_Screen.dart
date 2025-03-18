import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_admin/controller/OnBoarding_Controller.dart';
import 'package:ecommerce_admin/core/Constant/Color_Const.dart';
import 'package:ecommerce_admin/view/widget/onBoarding_widget.dart/button.dart';
import 'package:ecommerce_admin/view/widget/onBoarding_widget.dart/dots.dart';
import 'package:ecommerce_admin/view/widget/onBoarding_widget.dart/slider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingCOntroller());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Column(children: [
        const Expanded(flex: 4, child: OnBoardingSlider()),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                GetBuilder<OnBoardingCOntroller>(
                    builder: (controller) => const OnBoardingDots()),
                const OnBoardingButton()
              ],
            ))
      ]),
    );
  }
}
