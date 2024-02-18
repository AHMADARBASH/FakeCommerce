import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database _instance;

  static Future<void> createDatabase() async {
    await openDatabase(
      'fakecommerce.db',
      version: 1,
      onCreate: (db, version) async {
        await db
            .execute(
                'CREATE TABLE products (id INTEGER,title TEXT,price REAL,description TEXT,category TEXT,image TEXT,rating REAL)')
            .catchError((error) {});
      },
      onOpen: (db) => _instance = db,
    );
  }

  static Future<void> insertIntoDatabase(
      {required String tableName, required Map<String, dynamic> data}) async {
    await _instance.insert(tableName, data);
  }

  static Future<List<Map<String, dynamic>>> getDatafromDatabase(
      {required String tableName}) async {
    List<Map<String, dynamic>> data = [];
    data = await _instance.rawQuery('Select * from $tableName');
    return data;
  }

  static Future<void> deletefromDatabase(
      {required int id, required String tableName}) async {
    await _instance.delete(
      tableName,
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
