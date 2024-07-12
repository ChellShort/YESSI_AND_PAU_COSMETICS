import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'example.db');
    // Eliminar la base de datos existente
    await deleteDatabase(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cuentas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        correo TEXT UNIQUE,
        contraseña TEXT,
        username TEXT
      )
    ''');

    await db.insert('cuentas', {
      'correo': 'admin@outlook.com',
      'contraseña': 'admin12345678',
      'username': 'admin',
    });
  }

  Future<int> insertCuenta(Map<String, dynamic> cuenta) async {
    Database db = await database;
    return await db.insert('cuentas', cuenta);
  }

  Future<Map<String, dynamic>?> getCuentaByEmailAndPassword(String correo, String contrasena) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'cuentas',
      columns: ['correo', 'contraseña', 'username'],
      where: 'correo = ? AND contraseña = ?',
      whereArgs: [correo, contrasena],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getCuenta() async {
    Database db = await database;
    return await db.query('cuentas');
  }

  Future<int> updateCuenta(Map<String, dynamic> item) async {
    Database db = await database;
    int id = item['id'];
    return await db.update('cuentas', item, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteCuenta(int id) async {
    Database db = await database;
    return await db.delete('cuentas', where: 'id = ?', whereArgs: [id]);
  }
}
