import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/size_config.dart';
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
          title:
              Text('SURAH ${surah.name?.transliteration?.id?.toUpperCase()}'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: sizeConfig.getProportionateScreenHeight(10),
                  ),
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
                      SizedBox(
                          height: sizeConfig.getProportionateScreenHeight(10)),
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surah.numberOfVerses,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text('$index'),
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
                        const Text('Tulisan Arab')
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
