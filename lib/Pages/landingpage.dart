import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/Database/FavoritesDatabase.dart';
import 'package:testproject/Controllers/RegularControllers/DashborKontrol.dart';
import 'package:testproject/Controllers/RegularControllers/sportscontroller.dart';
import 'package:testproject/Pages/Fragments/Favorites.dart';
import 'package:testproject/Pages/Fragments/Home.dart';
import 'package:testproject/Pages/Fragments/Profile.dart';
import 'package:testproject/Pages/Fragments/Thing.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final SportsController sportsController = Get.put(SportsController(), permanent: true);
    final DatabaseHelper databaseHelper = Get.put(DatabaseHelper(), permanent: true);
    final UtamaController controller = Get.put(UtamaController());
    final List<Widget> pages = [
      Home(),
      Favorites(),
      thingamajig(),
      Profile(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedindex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedindex.value,
          onTap: controller.changeMenu,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, color: Colors.black),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star, color: Colors.black),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_sharp, color: Colors.black),
              label: "Thing",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
  void changeMenu(int index) {
    final UtamaController controller = Get.put(UtamaController());
    controller.selectedindex.value = index;
    if (index == 1) {
      final databaseHelper = Get.find<DatabaseHelper>();
      databaseHelper.loadFavorites();
    }
  }
}
