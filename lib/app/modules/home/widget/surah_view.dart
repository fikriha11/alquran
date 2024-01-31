import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/color.dart';
import '../../../data/models/surah.dart';
import '../../../routes/app_pages.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, required this.theme, required this.data});
  final bool theme;
  final Future<List<Surah>> data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: theme ? appWhite : appPurple,
            ),
          );
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
                leading: Container(
                  height: 70,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/list.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    '${surah.number}',
                    style: TextStyle(color: theme ? appWhite : appPurpleLight1),
                  )),
                ),
                title: Text(
                  '${surah.name?.transliteration?.id}',
                  style: TextStyle(color: theme ? appWhite : appPurpleLight1),
                ),
                subtitle: Text(
                  '${surah.numberOfVerses} Ayat | ${surah.revelation?.id}',
                  style: const TextStyle(color: appGrey),
                ),
                trailing: Text(
                  '${surah.name?.short}',
                  style: const TextStyle(fontSize: 20, color: appPurpleLight2),
                ),
              ),
            );
          },
        );
      },
      future: data,
    );
  }
}
