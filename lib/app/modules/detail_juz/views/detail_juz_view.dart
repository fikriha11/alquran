import 'package:alquran/app/data/models/juz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/color.dart';
import '../../../data/constant/size_config.dart';
import '../../../data/models/detail_juz.dart' as detail;
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  DetailJuzView({Key? key}) : super(key: key);
  final juz = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Juz juz = Get.arguments;
    final SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Juz ${juz.juz}'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getDetailJuz(juz.juz.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Text(' No Data');
          }
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              detail.DetailJuz detailJuz = snapshot.data![index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.getProportionateScreenWidth(10),
                  vertical: sizeConfig.getProportionateScreenHeight(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      color: Get.isDarkMode ? appPurpleLight1 : appWhite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: sizeConfig.getProportionateScreenWidth(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/list.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${detailJuz.number!.inQuran}',
                                  style: TextStyle(
                                    color:
                                        Get.isDarkMode ? appWhite : appPurple,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_add_outlined,
                                    color: appPurpleLight2,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_circle,
                                    color: appPurpleLight2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeConfig.getProportionateScreenHeight(10),
                    ),
                    Text(
                      '${detailJuz.text!.arab}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 25),
                      // style: Text,
                    ),
                    SizedBox(
                      height: sizeConfig.getProportionateScreenHeight(15),
                    ),
                    Text(
                      '${detailJuz.text!.transliteration!.en}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16),
                      // style: Text,
                    ),
                    SizedBox(
                      height: sizeConfig.getProportionateScreenHeight(15),
                    ),
                    Text(
                      '${detailJuz.translation!.id}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 20),
                      // style: Text,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
