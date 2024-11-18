import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/RegularControllers/sportscontroller.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final SportsController controller = Get.put(SportsController());

  @override
  Widget build(BuildContext context) {
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
                                Get.snackbar(post.strTeam, post.strLeague);
                              },
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
