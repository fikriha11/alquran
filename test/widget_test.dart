import 'dart:convert';

import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alquran/main.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  Uri url = Uri.parse('https://api.quran.gading.dev/surah/2');
  var response = await http.get(url);

  print(response.body.runtimeType);
}
