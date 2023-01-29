import 'package:flutter/material.dart';
import 'package:smart_group/data/models/country_model/countries_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = "countries";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("countries.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";

        await db.execute('''
        CREATE TABLE $tableName (
          ${CountryFields.id} $idType,
            ${CountryFields.capital} $textType,
            ${CountryFields.code} $textType,
            ${CountryFields.name_c} $textType,
            ${CountryFields.code_c} $textType,
            ${CountryFields.currency} $textType,
            ${CountryFields.emoji} $textType,
            ${CountryFields.name} $textType,
            ${CountryFields.phone} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<CountryModel> insertToDatabse(
      {required CountryModel countryModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, countryModel.toJson());
    debugPrint("ADD BOLDI HAMMASI YAXSHI");
    return countryModel.copyWith(id: id);
  }

  static Future<List<CountryModel>> getCachedCountries() async {
    var database = await getInstance.getDb();
    var listCountries = await database.query(
      tableName,
      columns: [
        CountryFields.id,
        CountryFields.capital,
        CountryFields.code,
        CountryFields.currency,
        CountryFields.emoji,
        CountryFields.name,
        CountryFields.phone,
        CountryFields.code_c,
        CountryFields.name_c
      ],
    );
    var list = listCountries.map((e) => CountryModel.json(e)).toList();

    return list;
  }

  static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }
}
