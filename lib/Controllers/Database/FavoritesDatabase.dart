import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper extends GetxController {
  static Database? _db;

  var favorites = <Map<String, dynamic>>[].obs;

  // Initialize Database
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'favorites_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            title TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  // Add a favorite
  Future<int> addFav(Map<String, dynamic> order) async {
    var dbClient = await db;
    int result = await dbClient!.insert('favorites', order);
    await loadFavorites(); // Reload after adding
    return result;
  }

  // Load favorites
  Future<void> loadFavorites() async {
    var dbClient = await db;
    final data = await dbClient!.query('favorites');
    print("Favorites loaded: $data");
    favorites.assignAll(data);
  }

  // Delete a favorite
  Future<void> deleteFav(int id) async {
    var dbClient = await db;
    await dbClient!.delete('favorites', where: 'id = ?', whereArgs: [id]);
    await loadFavorites();
  }

  // Clear all favorites
  Future<void> clearFav() async {
    var dbClient = await db;
    await dbClient!.delete('favorites');
    await loadFavorites(); // Reload after clearing
  }

  //ONLY USE THIS WHEN SHIT HAS BLOWN UP INTO PIECES, DO NOT USE ON PRODUCTION, THIS IS A QUICK FIX FOR PRACTICALLY ANYTHING
  Future<void> HARDRESET() async {
    var dbClient = await db;
    await dbClient!.execute('DROP TABLE IF EXISTS favorites');
    await dbClient.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT,
        title TEXT,
        description TEXT
      )
    ''');
    favorites.clear(); // Clear the in-memory list
    print("Database has been hard reset.");
    Get.snackbar("BOOM!!!!!", "Successfully nuked the database, well done!");
  }

}
