import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/Database/FavoritesDatabase.dart';
import 'package:testproject/Controllers/RegularControllers/sportscontroller.dart';
import 'package:testproject/Pages/Detailed.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final SportsController controller = Get.put(SportsController());
    final DatabaseHelper datas = Get.put(DatabaseHelper());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.ld.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      final post = controller.list[index];
                      return
                        ClipRRect(
                          child: Card(
                            elevation: 0,
                            color: Colors.grey.shade100,
                            child:
                            ListTile(
                              leading: Image.network(
                                post.strBadge,
                                width: 70,
                                height: 70,
                              ),
                              title: Text(post.strTeam),
                              subtitle: Text(post.strLeague),
                              onTap: () {
                                controller.toggleFavorite({
                                  'image': post.strBadge,
                                  'title': post.strTeam,
                                  'description': post.strLeague,
                                });
                              },
                              onLongPress: () {
                                Get.to(() => DetailScreen(post: post));
                              },
                              trailing: Obx(() {
                                final isFav = controller.isFavorite(post.strTeam);
                                return Icon(
                                  isFav ? Icons.favorite : Icons.favorite_border,
                                  color: isFav ? Colors.red : Colors.grey,
                                );
                              }),
                            ),
                          ),
                        );
                    },
                  ),
                );
              }
            }),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
