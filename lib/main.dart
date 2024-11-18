import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/LoginUtama.dart';
import 'package:testproject/Pages/landingpage.dart';
import 'package:testproject/RegisterUtama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ini test',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Loginutama()),
        GetPage(name: '/2', page: () => Registerutama()),
        GetPage(name: '/home', page:() => Landingpage()),
      ],
    );
  }
}
