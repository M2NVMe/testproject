import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Reuses/myButton.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          myButton(textButton: Text("LOGOUT"), backgroundColor: Colors.blueGrey, textColor: Colors.white, radius: 8, elevation: 0, onPressed: () {exit(0);}),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
