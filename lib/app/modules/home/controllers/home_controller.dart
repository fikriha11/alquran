import 'dart:convert';

import 'package:alquran/app/data/models/detail_juz.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/juz.dart';

class HomeController extends GetxController {
  final isThemeDark = false.obs;

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/');
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  Future<List<Juz>> getalljuz() async {
    List<Juz> allJuz = [];

    for (int i = 0; i < 30; i++) {
      Uri url = Uri.parse('https://api.quran.gading.dev/juz/${i + 1}');
      var res = await http.get(url);

      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)['data'];

      Juz datas = Juz.fromJson(data);
      allJuz.add(datas);
    }
    return allJuz;
  }
}
