import 'package:alquran/app/data/constant/color.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/size_config.dart';
import '../../../data/models/surah.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
            const Text(
              "Selamat Datang",
              style: TextStyle(
                color: appPurple,
                fontSize: 16,
              ),
            ),
            SizedBox(height: sizeConfig.getProportionateScreenHeight(30)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [appPurpleLight1, appPurpleLight2],
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
                                  const Icon(Icons.menu_book_rounded),
                                  SizedBox(
                                    width: sizeConfig
                                        .getProportionateScreenWidth(10),
                                  ),
                                  const Text(
                                    'Terakhir Dibaca',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    sizeConfig.getProportionateScreenHeight(20),
                              ),
                              const Text(
                                'Al-Fatihah',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                  height: sizeConfig
                                      .getProportionateScreenHeight(5)),
                              const Text(
                                'Ayat No 1',
                                style: TextStyle(
                                  fontSize: 10,
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
            ),
            // const TabBar(tabs: [
            //   Text('tab 1'),
            //   Text('tab 2'),
            //   Text('tab 3'),
            // ])
          ],
        ),
      ),

      //   body: FutureBuilder<List<Surah>>(
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(child: CircularProgressIndicator());
      //       }

      //       if (!snapshot.hasData) {
      //         return const Text('Tidak Ada Data');
      //       }

      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) {
      //           Surah surah = snapshot.data![index];
      //           return InkWell(
      //             onTap: () {
      //               Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
      //             },
      //             child: ListTile(
      //               leading: CircleAvatar(
      //                 child: Text('${index + 1}'),
      //               ),
      //               title: Text('${surah.name?.translation?.id}'),
      //               subtitle: Text(
      //                 '${surah.numberOfVerses} Ayat | ${surah.revelation?.id}',
      //               ),
      //               trailing: Text('${surah.name?.short}'),
      //             ),
      //           );
      //         },
      //       );
      //     },
      //     future: controller.getAllSurah(),
      //   ),
    );
  }
}
