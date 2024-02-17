import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/color.dart';
import '../../../data/constant/size_config.dart';
import '../../../data/models/juz.dart';
import '../../../routes/app_pages.dart';

class JuzView extends StatelessWidget {
  const JuzView({
    super.key,
    required this.theme,
    required this.data,
  });

  final bool theme;
  final Future<List<Juz>> data;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);

    return FutureBuilder<List<Juz>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('TIDAK ADA DATA'),
          );
        }
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            Juz juz = snapshot.data![index];
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.DETAIL_JUZ, arguments: juz);
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
                      '${index + 1}',
                      style:
                          TextStyle(color: theme ? appWhite : appPurpleLight1),
                    ),
                  ),
                ),
                title: Text(
                  'Juz ${index + 1}',
                  style: TextStyle(
                    color: theme ? appWhite : appPurple,
                  ),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mulai di : ${juz.juzStartInfo}',
                        style: const TextStyle(fontSize: 12, color: appGrey),
                      ),
                    ]),
              ),
            );
          },
        );
      },
      future: data,
    );
  }
}
