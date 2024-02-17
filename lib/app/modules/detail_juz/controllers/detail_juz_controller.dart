import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/detail_juz.dart';

class DetailJuzController extends GetxController {
  Future<List<DetailJuz>> getDetailJuz(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/juz/$id');
    var res = await http.get(url);
    List data =
        (json.decode(res.body) as Map<String, dynamic>)['data']['verses'];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => DetailJuz.fromJson(e)).toList();
    }
  }
}
