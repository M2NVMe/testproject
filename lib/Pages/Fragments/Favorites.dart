import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/Database/FavoritesDatabase.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});
  final DatabaseHelper datas = Get.put(DatabaseHelper());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
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
                        onPressed: () {
                          if (item['id'] != null) {
                            datas.deleteFav(item['id']);
                            Get.snackbar('Removed from Favorites', item['title']);
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
