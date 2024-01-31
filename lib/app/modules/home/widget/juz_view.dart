import 'package:flutter/material.dart';

import '../../../data/constant/color.dart';

class JuzView extends StatelessWidget {
  const JuzView({super.key, required this.theme});
  final bool theme;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
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
                style: TextStyle(color: theme ? appWhite : appPurpleLight1),
              ),
            ),
          ),
          title: Text('Juz ${index + 1}'),
        );
      },
    );
  }
}
