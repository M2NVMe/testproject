import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/Database/FavoritesDatabase.dart';
import 'package:testproject/Reuses/myButton.dart';

class thingamajig extends StatelessWidget {
  thingamajig({super.key});
  final DatabaseHelper datas = Get.put(DatabaseHelper());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          myButton(textButton: Text("HARD RESET"), backgroundColor: Colors.red, textColor: Colors.white, radius: 8, elevation: 0, onPressed: datas.HARDRESET),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
