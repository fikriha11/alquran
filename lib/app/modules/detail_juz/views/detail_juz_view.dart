import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  DetailJuzView({Key? key}) : super(key: key);
  final juz = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailJuzView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailJuzView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}