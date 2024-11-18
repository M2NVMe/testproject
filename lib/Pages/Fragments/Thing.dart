import 'package:flutter/material.dart';
import 'package:get/get.dart';

class thingamajig extends StatelessWidget {
  const thingamajig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Text("Ini ga tau"),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
