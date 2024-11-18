import 'package:get/get.dart';
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
    List<Map<String, dynamic>> queryResult = await dbClient!.query('favorites');
    favorites.assignAll(queryResult); // Update the observable list
  }

  // Delete a favorite
  Future<void> deleteFav(int id) async {
    var dbClient = await db;
    await dbClient!.delete('favorites', where: 'id = ?', whereArgs: [id]);
    await loadFavorites(); // Reload after deleting
  }

  // Clear all favorites
  Future<void> clearFav() async {
    var dbClient = await db;
    await dbClient!.delete('favorites');
    await loadFavorites(); // Reload after clearing
  }
}
