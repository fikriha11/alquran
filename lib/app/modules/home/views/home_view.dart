import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/surah.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Text('Tidak Ada Data');
          }

          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Surah surah = snapshot.data![index];
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('${surah.name?.translation?.id}'),
                  subtitle: Text(
                    '${surah.numberOfVerses} Ayat | ${surah.revelation?.id}',
                  ),
                  trailing: Text('${surah.name?.short}'),
                ),
              );
            },
          );
        },
        future: controller.getAllSurah(),
      ),
    );
  }
}
