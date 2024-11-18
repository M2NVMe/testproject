import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/Database/FavoritesDatabase.dart';
import 'package:testproject/Reuses/myButton.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});

  Widget build(BuildContext context) {
    final DatabaseHelper datas = Get.put(DatabaseHelper());
    datas.loadFavorites();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
                Obx(() {
                  if (datas.favorites.isEmpty) {
                    return Center(
                      child: Text(
                        "No favorites yet!",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: datas.favorites.length,
                    itemBuilder: (context, index) {
                      final item = datas.favorites[index];
                      return Card(
                        color: Colors.grey.shade100,
                        child: ListTile(
                          leading: Image.network(
                            item['image'],
                            width: 70,
                            height: 70,
                          ),
                          title: Text(item['title']),
                          subtitle: Text(item['description']),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              if (item['id'] != null) {
                                await datas.deleteFav(item['id']);
                                await datas.loadFavorites(); // Reload favorites
                                Get.snackbar(
                                  'Removed from Favorites',
                                  item['title'],
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
                //myButton(textButton: Text("Clear"), backgroundColor: Colors.black, textColor: Colors.white, radius: 8, elevation: 0, onPressed: () => datas.clearFav()),
          ),
        ],
      ),
    );
  }
}
