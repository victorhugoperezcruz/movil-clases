import 'package:ejercicio1/utils/sqlite/model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DBHelper{
  static Database ? _db;
  Future<Database> get db async {
    if(_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async{
    if (kIsWeb){
      databaseFactory = databaseFactoryFfiWeb;
    }
    else{
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final path = join(await getDatabasesPath(), 'usuarios.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{
        await db.execute(''''
        CREATE TABLE usuarios(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT)
        ''');
      }
    );
  }

  Future<int> insertUsuario(Usuario u) async{
    final dbClient = await db;
    return  await dbClient.insert('usuarios', u.toMap());
  }
}