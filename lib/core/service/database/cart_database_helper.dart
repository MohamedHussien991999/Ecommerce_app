import 'package:ecommerce_application/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constant/constant.dart';

class CartDatabaseHelper {
  // Private constructor for singleton pattern
  CartDatabaseHelper._();

  // Singleton instance
  static final CartDatabaseHelper db = CartDatabaseHelper._();

  // Database object

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database ??= await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'cart.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $tableCartProduct(
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL, 
          $columnPrice TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL,
          $columnProductId TEXT NOT NULL
        )
        ''');
      },
    );
  }

  Future<List<CartProductModel>> getAllProducts() async {
    Database? dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps
            .map((product) =>
                CartProductModel.fromJson(product as Map<String, dynamic>))
            .toList()
        : [];
    return list;
  }

  Future<int> insert(CartProductModel model) async {
    Database? dbClient = await database;
    return await dbClient!.insert(
        tableCartProduct, model.toJson() ,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct ( CartProductModel model) async {
    var dbClient= await database;

    return await dbClient!.update(tableCartProduct, model.toJson(), 
    where: '$columnProductId = ?', whereArgs: [model.productId]);
  }


}
