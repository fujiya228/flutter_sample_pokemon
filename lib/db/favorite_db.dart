import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../consts/favorite_db.dart';

class FavoritesDb {
  static Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), favFileName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $favTableName(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1,
    );
  }
}
