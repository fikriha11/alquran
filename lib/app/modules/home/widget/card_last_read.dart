import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/color.dart';
import '../../../data/constant/size_config.dart';

class CardLastRead extends StatelessWidget {
  const CardLastRead({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: sizeConfig.getProportionateScreenHeight(30),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              appPurpleLight2,
              appPurpleLight1,
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            hoverColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -50,
                    right: -5,
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Opacity(
                        opacity: 0.9,
                        child: Image.asset('assets/img/alquran-logo.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.menu_book_rounded,
                                color: appWhite),
                            SizedBox(
                              width: sizeConfig.getProportionateScreenWidth(10),
                            ),
                            const Text(
                              'Terakhir Dibaca',
                              style: TextStyle(fontSize: 13, color: appWhite),
                            )
                          ],
                        ),
                        SizedBox(
                          height: sizeConfig.getProportionateScreenHeight(20),
                        ),
                        const Text(
                          'Al-Fatihah',
                          style: TextStyle(fontSize: 18, color: appWhite),
                        ),
                        SizedBox(
                            height: sizeConfig.getProportionateScreenHeight(5)),
                        const Text(
                          'Ayat No 1',
                          style: TextStyle(fontSize: 10, color: appWhite),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
