import 'package:flutter/cupertino.dart';
import 'package:smart_group/data/api/models/countries_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = "countriesTable";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDb("countries.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDb(String fileName) async {
    var dbPath =  getDatabasesPath();
    String path = join( await dbPath, fileName);
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";

        await db.execute('''
CREATE TABLE $tableName(
   ${CountriesFields.id} $idType,
   ${CountriesFields.name} $textType,
   ${CountriesFields.capital} $textType,
   ${CountriesFields.code} $textType,
   ${CountriesFields.phone} $textType,
   ${CountriesFields.emoji} $textType,
   ${CountriesFields.currency} $textType
   ${CountriesFields.code_c} $textType
   ${CountriesFields.code_n} $textType
  )
''');
      },
    );
    return database;
  }

 static Future<CountryModel> insertCountry(
      {required CountryModel countryModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, countryModel.toJson());
    debugPrint("ADD BOLDI HAMMASI YAXSHI");
    return countryModel.copyWith(id: id);
  }

  static Future<List<CountryModel>> getCachedCountries() async {
    var dataBase = await getInstance.getDb();
    var listOfCountries = await dataBase.query(tableName, columns: [
      CountriesFields.id,
      CountriesFields.name,
      CountriesFields.phone,
      CountriesFields.emoji,
      CountriesFields.capital,
      CountriesFields.code,
      CountriesFields.currency,
      CountriesFields.code_c,
      CountriesFields.code_n,
    ]);
    var list = listOfCountries.map((e) => CountryModel.json(e)).toList();
    return list;
  }

  static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }
}
