import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteService {
  static Database? _db;

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "notes.db");
    return await openDatabase(
      version: 1,
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "notes"(
      "title" TEXT , "subtitle" TEXT, "date" TEXT, "color" INTEGER
    )
    ''');
    debugPrint("create database run _onCreate================ ");
  }

  Future<Database?> get db async {
    _db ??= await initDB();
    return _db;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    debugPrint("run _on upgrade====================");
  }
}
