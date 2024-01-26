import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        backgroundColor: Colors.blue,
        title: Text('SURAH ${surah.name?.transliteration?.id?.toUpperCase()}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.getProportionateScreenHeight(10),
                  horizontal: sizeConfig.getProportionateScreenWidth(120)),
              child: Column(
                children: [
                  Text(
                    '${surah.name?.transliteration?.id}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '(${surah.name?.translation?.id})',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: sizeConfig.getProportionateScreenHeight(10)),
                  Text(
                    '${surah.numberOfVerses} | ${surah.revelation?.id} ',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
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
                return const Text('Tidak ada Data');
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.verses?.length,
                  itemBuilder: (context, index) {
                    detail.Verse? ayat = snapshot.data?.verses?[index];
                    return Padding(
                      padding: EdgeInsets.all(
                          sizeConfig.getProportionateScreenWidth(20)),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Card(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    sizeConfig.getProportionateScreenWidth(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        child: Text('${index + 1}'),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.bookmark_add_outlined,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.play_circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                ayat?.text?.arab ?? 'error',
                                textAlign: TextAlign.end,
                                style: const TextStyle(fontSize: 25),
                                // style: Text,
                              ),
                              SizedBox(
                                height:
                                    sizeConfig.getProportionateScreenHeight(10),
                              ),
                              Text(
                                ayat?.text?.transliteration?.en ?? "error",
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 16),
                                // style: Text,
                              ),
                              SizedBox(
                                height:
                                    sizeConfig.getProportionateScreenHeight(10),
                              ),
                              Text(
                                ayat?.translation?.id ?? 'error',
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 20),
                                // style: Text,
                              ),
                            ],
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
