import 'package:alquran/app/data/constant/color.dart';
import 'package:alquran/app/modules/home/widget/card_last_read.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/constant/size_config.dart';
import '../controllers/home_controller.dart';
import '../widget/juz_view.dart';
import '../widget/surah_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              controller.isThemeDark.value ? Icons.light_mode : Icons.dark_mode,
              color: controller.isThemeDark.value ? appWhite : appPurpleDark,
            ),
            onPressed: () {
              controller.isThemeDark.value = !controller.isThemeDark.value;
              if (controller.isThemeDark.value) {
                Get.changeThemeMode(ThemeMode.dark);
              } else {
                Get.changeThemeMode(ThemeMode.light);
              }
            },
          ),
          title: const Text('Quran App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.SEARCH_PAGE);
              },
              icon: const Icon(Icons.search),
            ),
            SizedBox(width: sizeConfig.getProportionateScreenWidth(10))
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Assalamu'alaikum",
                  style: TextStyle(
                    color: appGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Selamat Datang",
                  style: TextStyle(
                    color: controller.isThemeDark.value ? appWhite : appPurple,
                    fontSize: 16,
                  ),
                ),
                const CardLastRead(),
                TabBar.secondary(
                  dividerColor: Colors.transparent,
                  labelColor:
                      controller.isThemeDark.value ? appWhite : Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        height: sizeConfig.getProportionateScreenHeight(30),
                        child: const Text(
                          'SURAH',
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: sizeConfig.getProportionateScreenHeight(30),
                        child: const Text(
                          'JUZ',
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: sizeConfig.getProportionateScreenHeight(30),
                        child: const Text(
                          'BOOKMARK',
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SurahView(
                        theme: controller.isThemeDark.value,
                        data: controller.getAllSurah(),
                      ),
                      JuzView(
                        theme: controller.isThemeDark.value,
                      ),
                      const Center(
                        child: Text(
                          'BOOKMARK',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
