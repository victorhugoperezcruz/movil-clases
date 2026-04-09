import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'usuario.dart';

class DBHelper{
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async{
    if(_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async{
    String path = join(await getDatabasesPath(), 'api_usuarios.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async{
        await db.execute('''
          CREATE TABLE usuarios(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT,
            ap_paterno TEXT,
            ap_materno TEXT,
            edad INTEGER,
            bandera INTEGER
          )
          '''
        );
      },
    );
  }

  Future<int> insertUsuario(Usuario usuario) async{
    final dbClient = await db;
    return await dbClient.insert('usuarios', usuario.toMap());
  }

  Future<List<Usuario>> getUsuarios() async{
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('usuarios');
    return List.generate(maps.length, (i){
      return Usuario(
          id: maps[i]['id'],
          nombre: maps[i]['nombre'],
          apPaterno: maps[i]['ap_paterno'],
          apMaterno: maps[i]['ap_materno'],
          edad: maps[i]['edad'],
          bandera: maps[i]['bandera']);
    });
  }

  Future<int> updateUsuario(Usuario usuario) async{
    final dbClient = await db;
    return await dbClient.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id]
    );
  }

  Future<int> deleteUsuario(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<void> clearTable() async{
    final dbClient = await db;
    await dbClient.delete('usuarios');
  }
}