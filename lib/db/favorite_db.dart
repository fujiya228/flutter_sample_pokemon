import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoritesDb {
  static Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'poke_favs.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1,
    );
  }
}
