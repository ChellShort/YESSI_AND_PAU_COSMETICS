import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
        id_cuenta INTEGER PRIMARY KEY AUTOINCREMENT,
        correo TEXT UNIQUE,
        contraseña TEXT,
        username TEXT,
        id_direccion INTEGER,
        telefono TEXT,
        FOREIGN KEY (id_direccion) REFERENCES direcciones (id_direccion) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    ''');

    await db.execute('''
      CREATE TABLE direcciones (
        id_direccion INTEGER PRIMARY KEY AUTOINCREMENT,
        calle TEXT,
        colonia TEXT,
        municipio TEXT,
        estado TEXT,
        pais TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE categorias (
        id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE subcategoria (
        id_subcategoria INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE marcas (
        id_marca INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE productos (
        id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        descripcion TEXT,
        estrellas INTEGER,
        precio DOUBLE,
        imagen TEXT,
        id_marca INTEGER,
        id_categoria INTEGER,
        id_subcategoria INTEGER,
        FOREIGN KEY (id_marca) REFERENCES marcas (id_marca) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (id_subcategoria) REFERENCES subcategoria (id_subcategoria) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    ''');

    await db.execute('''
      CREATE TABLE compras (
        id_compra INTEGER PRIMARY KEY AUTOINCREMENT,
        id_cuenta INTENGER,
        id_producto INTEGER,
        cantidad INTEGER,
        fecha_compra DATETIME NOT NULL,
        FOREIGN KEY (id_cuenta) REFERENCES cuentas (id_cuenta) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (id_producto) REFERENCES productos (id_producto) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    ''');

    await db.insert('direcciones', {
      'calle': 'Calle los Pinos',
      'colonia': 'Arboleda',
      'municipio': 'Tula de Allende Hidalgo',
      'estado': 'Hidalgo',
      'pais': 'México'
    });

    await db.insert('cuentas', {
      'correo': 'admin@outlook.com',
      'contraseña': 'admin12345678',
      'id_direccion': 1,
      'username': 'admin'
    });

    await db.insert('marcas', {'nombre': 'Loreal Paris'}); // id_marca = 1

    await db.insert('categorias', {'nombre': 'Maquillaje'}); // id_categoria = 1
    await db.insert('categorias', {'nombre': 'Skincare'}); // id_categoria = 2
    await db.insert('categorias', {'nombre': 'Cabello'}); // id_categoria = 3
    await db.insert(
        'categorias', {'nombre': 'Cuidado Corporal'}); // id_categoria = 4

    await db.insert('subcategoria',
        {'nombre': 'Cara'}); // id_subcategoria = 1 categoria = 1
    await db.insert('subcategoria',
        {'nombre': 'Ojos'}); // id_subcategoria = 2 categoria = 1
    await db.insert('subcategoria',
        {'nombre': 'Labios'}); // id_subcategoria = 3 categoria = 1
    await db.insert('subcategoria',
        {'nombre': 'Uñas'}); // id_subcategoria = 4 categoria = 1
    await db.insert('subcategoria',
        {'nombre': 'Accesorios'}); // id_subcategoria = 5 categoria = 1
    await db.insert('subcategoria', {
      'nombre': 'Mascarillas y scrums'
    }); // id_subcategoria = 6 categoria = 2
    await db.insert('subcategoria',
        {'nombre': 'Hidratantes'}); // id_subcategoria = 7 categoria = 2
    await db.insert('subcategoria',
        {'nombre': 'Mist & Tonicos'}); // id_subcategoria = 8 categoria = 2
    await db.insert('subcategoria',
        {'nombre': 'Limpieza Facial'}); // id_subcategoria = 9 categoria = 2
    await db.insert('subcategoria',
        {'nombre': 'Cuidado de ojos'}); // id_subcategoria = 10 categoria = 2
    await db.insert('subcategoria',
        {'nombre': 'Electricos'}); // id_subcategoria = 11 categoria = 3
    await db.insert('subcategoria',
        {'nombre': 'Tratamientos'}); // id_subcategoria = 12 categoria = 3
    await db.insert('subcategoria',
        {'nombre': 'Tintes'}); // id_subcategoria = 13 categoria = 3
    await db.insert('subcategoria',
        {'nombre': 'Accesorios'}); // id_subcategoria = 14 categoria = 3
    await db.insert('subcategoria',
        {'nombre': 'Shampoos'}); // id_subcategoria = 15 categoria = 3
    await db.insert('subcategoria',
        {'nombre': 'Body Mist'}); // id_subcategoria = 16 categoria = 4
    await db.insert('subcategoria',
        {'nombre': 'Depilacion'}); // id_subcategoria = 17 categoria = 4
    await db.insert('subcategoria',
        {'nombre': 'Bronceadores'}); // id_subcategoria = 18 categoria = 4
    await db.insert('subcategoria', {
      'nombre': 'Hidratante corporal'
    }); // id_subcategoria = 19 categoria = 4

    await db.insert('productos', {
      'nombre': 'FIJADOR DE MAQUILLAJE INFALLIBLE SETTING SPRAY 75ML',
      'descripcion':
          '¡Infallible Fix Spray fijará tu maquillaje por hasta 36 horas y secará en tan solo 5 segundos!',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://pyxis.nymag.com/v1/imgs/03f/b54/8a4d5f51e3a5ab3c98333686ada7bc78b7-thelip-21-shirafuji-cap.2x.w710.jpg',
      'id_marca': 1,
      'id_categoria': 1,
      'id_subcategoria': 1
    });
    await db.insert('productos', {
      'nombre':
          'BASE DE MAQUILLAJE INFALLIBLE 24H FRESH WEAR 24H FRESH WEAR 30ML',
      'descripcion':
          'Base de maquillaje de larga duración con cobertura media-alta y acabado natural.',
      'estrellas': 3,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 1,
      'id_subcategoria': 2
    });
    await db.insert('productos', {
      'nombre': 'LABIAL INFALLIBLE PRO-MATTE LIQUID LIPSTICK 7ML',
      'descripcion': 'Labial líquido de larga duración con acabado mate.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 1,
      'id_subcategoria': 3
    });
    await db.insert('productos', {
      'nombre': 'ESMALTE DE UÑAS INFALLIBLE GEL DUO 2X 5ML',
      'descripcion': 'Esmalte de uñas de larga duración con acabado en gel.',
      'estrellas': 2,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 1,
      'id_subcategoria': 4
    });
    await db.insert('productos', {
      'nombre': 'CEPILLO DE CEJAS Y PESTAÑAS',
      'descripcion': 'Cepillo de cejas y pestañas con cerdas de nylon.',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 1,
      'id_subcategoria': 5
    });
    await db.insert('productos', {
      'nombre': 'MASCARILLA DE ARCILLA PURA 50ML',
      'descripcion':
          'Mascarilla de arcilla pura con 3 arcillas minerales y carbón.',
      'estrellas': 3,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 2,
      'id_subcategoria': 6
    });
    await db.insert('productos', {
      'nombre': 'HIDRATANTE REVITALIFT LASER X3 50ML',
      'descripcion': 'Hidratante anti-edad con ácido hialurónico y pro-xylane.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 2,
      'id_subcategoria': 7
    });
    await db.insert('productos', {
      'nombre': 'MIST TONICO REVITALIFT LASER X3 125ML',
      'descripcion':
          'Mist tónico anti-edad con ácido hialurónico y pro-xylane.',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 2,
      'id_subcategoria': 8
    });
    await db.insert('productos', {
      'nombre': 'GEL LIMPIADOR REVITALIFT LASER X3 150ML',
      'descripcion':
          'Gel limpiador anti-edad con ácido hialurónico y pro-xylane.',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 2,
      'id_subcategoria': 9
    });
    await db.insert('productos', {
      'nombre': 'CONTORNO DE OJOS REVITALIFT LASER X3 15ML',
      'descripcion':
          'Contorno de ojos anti-edad con ácido hialurónico y pro-xylane.',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 2,
      'id_subcategoria': 10
    });
    await db.insert('productos', {
      'nombre': 'SECADORA DE CABELLO 2000W',
      'descripcion':
          'Secadora de cabello con 2000W de potencia y 3 velocidades.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 3,
      'id_subcategoria': 11
    });
    await db.insert('productos', {
      'nombre': 'TRATAMIENTO ELVIVE DREAM LONG 200ML',
      'descripcion':
          'Tratamiento para cabello largo con aceite de ricino y keratina vegetal.',
      'estrellas': 3,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 3,
      'id_subcategoria': 12
    });
    await db.insert('productos', {
      'nombre': 'TINTE EXCELLENCE CREAM 1 UNIDAD',
      'descripcion': 'Tinte para cabello con pro-keratina y ceramida.',
      'estrellas': 3,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 3,
      'id_subcategoria': 13
    });
    await db.insert('productos', {
      'nombre': 'CEPILLO ALISADOR DE CABELLO',
      'descripcion':
          'Cepillo alisador de cabello con cerdas de cerámica y tecnología iónica.',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 3,
      'id_subcategoria': 14
    });
    await db.insert('productos', {
      'nombre': 'SHAMPOO ELVIVE DREAM LONG 400ML',
      'descripcion':
          'Shampoo para cabello largo con aceite de ricino y keratina vegetal.',
      'estrellas': 5,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 3,
      'id_subcategoria': 15
    });
    await db.insert('productos', {
      'nombre': 'BODY MIST LA VIE EST BELLE 100ML',
      'descripcion': 'Body mist con aroma floral y frutal.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 4,
      'id_subcategoria': 16
    });
    await db.insert('productos', {
      'nombre': 'CREMA DEPILATORIA 200ML',
      'descripcion':
          'Crema depilatoria con aceite de rosa mosqueta y vitamina E.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 4,
      'id_subcategoria': 17
    });
    await db.insert('productos', {
      'nombre': 'BRONCEADOR SUBLIME BRONZE 200ML',
      'descripcion': 'Bronceador con aceite de argán y vitamina E.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 4,
      'id_subcategoria': 18
    });
    await db.insert('productos', {
      'nombre': 'HIDRATANTE CORPORAL NUTRITIVA 400ML',
      'descripcion':
          'Hidratante corporal con aceite de almendras y manteca de karité.',
      'estrellas': 4,
      'precio': 319.00,
      'imagen':
          'https://bellisima.mx/cdn/shop/files/3600524104726_1_800x.jpg?v=1717717049',
      'id_marca': 1,
      'id_categoria': 4,
      'id_subcategoria': 19
    });
  }

  Future<int> insertCuenta(Map<String, dynamic> cuenta) async {
    Database db = await database;
    return await db.insert('cuentas', cuenta);
  }

  Future<Map<String, dynamic>?> getCuentaByEmailAndPassword(
      String correo, String contrasena) async {
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

  Future<List<Map<String, dynamic>>> getTopProducts() async {
    Database db = await database;
    String query = '''
    SELECT 
      p.*, 
      m.nombre AS marca, 
      c.nombre AS categoria, 
      s.nombre AS subcategoria
    FROM 
      productos p
    JOIN 
      marcas m ON p.id_marca = m.id_marca
    JOIN 
      categorias c ON p.id_categoria = c.id_categoria
    JOIN 
      subcategoria s ON p.id_subcategoria = s.id_subcategoria
    ORDER BY 
      p.estrellas DESC
    LIMIT 5
  ''';
    return await db.rawQuery(query);
  }

  Future<List<Map<String, dynamic>>> searchProductsByName(String query) async {
  Database db = await database;
  String results = '''
    SELECT 
      p.*, 
      m.nombre AS marca, 
      c.nombre AS categoria, 
      s.nombre AS subcategoria
    FROM 
      productos p
    JOIN 
      marcas m ON p.id_marca = m.id_marca
    JOIN 
      categorias c ON p.id_categoria = c.id_categoria
    JOIN 
      subcategoria s ON p.id_subcategoria = s.id_subcategoria
    WHERE 
      p.nombre LIKE ? 
    ORDER BY 
      p.estrellas DESC
    LIMIT 5
  ''';

  return await db.rawQuery(results, ['%$query%']);
}

Future<List<String>> getMarcas() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('marcas', columns: ['nombre']);
    return List<String>.from(result.map((marca) => marca['nombre']));
  }

  Future<List<String>> getTiposProductos() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('categorias', columns: ['nombre']);
    return List<String>.from(result.map((categorias) => categorias['nombre']));
  }

  Future<List<String>> getSubCategorias(String? subcategoria) async {
    Database db = await database;
    String idsubcategorias='';
    if (subcategoria == 'maquillaje') {
      idsubcategorias = 'id_subcategoria IN (1,2,3,4,5)';
    } else if (subcategoria == 'skincare') {
      idsubcategorias = 'id_subcategoria IN (6,7,8,9,10)';
    } else if (subcategoria == 'cabello') {
      idsubcategorias = 'id_subcategoria IN (11,12,13,14,15)';
    } else if (subcategoria == 'cuidado corporal') {
      idsubcategorias = 'id_subcategoria IN (16,17,18,19)';
    } else {
      print('No resultados');
    }
    List<Map<String, dynamic>> result = await db.query('subcategoria', columns: ['nombre'] , where: idsubcategorias);
    return List<String>.from(result.map((subcategoriasCC) => subcategoriasCC['nombre']));
  }

  Future<double> getHighestPrice() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT MAX(precio) AS precio FROM productos');
    return result.first['precio'];
  }

  Future<List<Map<String, dynamic>>> searchProducts(
    {
    String? name,
    String? brand,
    String? category,
    String? subcategory,
    required RangeValues priceRange}) async {
  Database db = await database;
  
  String whereClause = 'p.precio BETWEEN ? AND ?';
  List<dynamic> whereArgs = [priceRange.start, priceRange.end];
  
  if (brand != null) {
    whereClause += ' AND m.nombre = ?';
    whereArgs.add(brand);
  }

  if (category != null) {
    whereClause += ' AND c.nombre = ?';
    whereArgs.add(category);
  }
  if (name != null) {
    whereClause += ' AND p.nombre LIKE ?';
    whereArgs.add('%$name%');
  }
  if (subcategory != null) {
    whereClause += ' AND s.nombre = ?';
    whereArgs.add(subcategory);
  }
  
  String query = '''
    SELECT 
      p.*, 
      m.nombre AS marca, 
      c.nombre AS categoria, 
      s.nombre AS subcategoria
    FROM 
      productos p
    JOIN 
      marcas m ON p.id_marca = m.id_marca
    JOIN 
      categorias c ON p.id_categoria = c.id_categoria
    JOIN 
      subcategoria s ON p.id_subcategoria = s.id_subcategoria
    WHERE 
      $whereClause
    ORDER BY 
      p.estrellas DESC
    LIMIT 10
  ''';

  return await db.rawQuery(query, whereArgs);
}
}
