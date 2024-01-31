import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/color.dart';
import '../../../data/constant/size_config.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/surah.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Surah surah = Get.arguments;
    final SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SURAH ${surah.name?.transliteration?.id?.toUpperCase()}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: sizeConfig.getProportionateScreenHeight(10)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  appPurpleLight2,
                  appPurpleLight1,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: sizeConfig.getProportionateScreenHeight(10),
                horizontal: sizeConfig.getProportionateScreenWidth(120),
              ),
              child: Column(
                children: [
                  Text(
                    '${surah.name?.transliteration?.id}'.toUpperCase(),
                    style: const TextStyle(fontSize: 20, color: appWhite),
                  ),
                  Text(
                    '( ${surah.name?.translation?.id} )'.toUpperCase(),
                    style: const TextStyle(fontSize: 15, color: appWhite),
                  ),
                  SizedBox(height: sizeConfig.getProportionateScreenHeight(10)),
                  Text(
                    '${surah.numberOfVerses} | ${surah.revelation?.id} ',
                    style: const TextStyle(fontSize: 15, color: appWhite),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getDetailSurah(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const Expanded(
                  child: Center(
                    child: Text('Tidak ada Data'),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.verses?.length,
                  itemBuilder: (context, index) {
                    detail.Verse? ayat = snapshot.data?.verses?[index];
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
                                horizontal:
                                    sizeConfig.getProportionateScreenWidth(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/img/list.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${surah.number}',
                                        style: TextStyle(
                                          color: Get.isDarkMode
                                              ? appWhite
                                              : appPurple,
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
                            ayat?.text?.arab ?? 'error',
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 25),
                            // style: Text,
                          ),
                          SizedBox(
                            height: sizeConfig.getProportionateScreenHeight(15),
                          ),
                          Text(
                            ayat?.text?.transliteration?.en ?? "error",
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 16),
                            // style: Text,
                          ),
                          SizedBox(
                            height: sizeConfig.getProportionateScreenHeight(15),
                          ),
                          Text(
                            ayat?.translation?.id ?? 'error',
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20),
                            // style: Text,
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
