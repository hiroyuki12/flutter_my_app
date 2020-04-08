import 'dart:io';

import 'package:flutter_my_app/model/Page.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProviderQiita {
  DBProviderQiita._();
  static final DBProviderQiita db = DBProviderQiita._();

  static Database _database;
  static final _tableName = "SavedPage";

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // DBがなかったら作る
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // import 'package:path/path.dart'; が必要
    // なぜか サジェスチョンが出てこない
    String path = join(documentsDirectory.path, "QiitaDB3.db");

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {

    // sqliteではDate型は直接保存できないため、文字列形式で保存する
    return await db.execute(
      "CREATE TABLE $_tableName ("
      "id INT PRIMARY KEY,"
      "page INT,"
      "perPage INT"
      ")"
    );
  }

  createPage(MyPage page) async {
    final db = await database;
    var res = await db.insert(_tableName, page.toMap());
    return res;
  }

  getAllPage() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<MyPage> list =
        res.isNotEmpty ? res.map((c) => MyPage.fromMap(c)).toList() : [];
    return list;
  }

  updatePage(MyPage page) async {
    final db = await database;
    var res  = await db.update(
      _tableName, 
      page.toMap(),
      where: "id = 1",
    );
    return res;
  }

  deletePage(String id) async {
    final db = await database;
    var res = db.delete(
      _tableName,
      where: "id = 1",
    );
    return res;
  }

}