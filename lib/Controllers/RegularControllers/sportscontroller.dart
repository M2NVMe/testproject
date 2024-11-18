import 'package:get/get.dart';
import 'package:testproject/Controllers/Apis/models/LeagueModel.dart';
import 'package:testproject/Controllers/Apis/sportsdbapi.dart';
import 'package:testproject/Controllers/Database/FavoritesDatabase.dart';

class SportsController extends GetxController {
  var ld = true.obs;
  var list = <League>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
    dbHelper.loadFavorites(); // Load favorites on initialization
  }

  void fetchPosts() async {
    try {
      ld(true);
      var posts = await Sportsdbapi().fetchPosts();
      list.assignAll(posts);
    } finally {
      ld(false);
    }
  }

  /// Check if a league is a favorite by its title
  bool isFavorite(String title) {
    return dbHelper.favorites.any((fav) => fav['title'] == title);
  }

  Future<void> toggleFavorite(Map<String, dynamic> item) async {
    if (isFavorite(item['title'])) {
      final fav = dbHelper.favorites.firstWhere((fav) => fav['title'] == item['title']);
      await dbHelper.deleteFav(fav['id']);
      Get.snackbar('Removed from Favorites', item['title']);
    } else {
      // Add item to database
      await dbHelper.addFav({
        'image': item['image'],
        'title': item['title'],
        'description': item['description'],
      });
      await dbHelper.loadFavorites(); // Refresh the favorites list
      Get.snackbar('Added to Favorites', item['title']);
    }
  }


}
