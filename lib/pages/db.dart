import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  get db async {
    _db ??= await intDb();
    return _db;
  }

  intDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "tasks.db");
    Database mydb = await openDatabase(path, version: 1, onCreate: _oncreate);
    return mydb;
  }

  _oncreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "taches" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"name" TEXT NOT NULL,
"date" TEXT NOT
NULL)''');
  }

  read(String sql) async {
    //select
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insert(String sql) async {
    //insert
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  update(String sql) async {
    //update
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  delete(String sql) async {
    //delete
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
