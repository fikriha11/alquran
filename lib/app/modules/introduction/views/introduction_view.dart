import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../data/constant/size_config.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Al-Qur'an Apps",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(10)),
          const Text(
            "Seberapakah sibuk anda\nsampai tidak membaca al - qu'ran",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(20)),
          SizedBox(
            width: sizeConfig.getProportionateScreenHeight(250),
            height: sizeConfig.getProportionateScreenHeight(250),
            child: Lottie.asset(
              'assets/lotties/alquran-animation.json',
            ),
          ),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(50)),
          InkWell(
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Container(
              width: sizeConfig.getProportionateScreenWidth(200),
              height: sizeConfig.getProportionateScreenHeight(40),
              decoration: BoxDecoration(
                color: Colors.teal.shade500,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text(
                'MULAI',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
            ),
          )
        ],
      ),
    ));
  }
}
