import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();

  static Database? _database;
  static final CartDataBaseHelper db = CartDataBaseHelper._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE ${Constants.tableCartProduct} (
      ${Constants.columnName} TEXT NOT NULL,
      ${Constants.columnImage} TEXT NOT NULL,
      ${Constants.columnPrice} TEXT NOT NULL,
      ${Constants.columnQuantity} INTEGER NOT NULL,
      ${Constants.columnProductId} TEXT NOT NULL)
      ''');
    });
  }

  insert(CartProductModel cartProductModel) async {
    var dbClient = await database;
    await dbClient?.insert(
        Constants.tableCartProduct, cartProductModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(Constants.tableCartProduct);
    List<CartProductModel> list = List.from(maps.isNotEmpty
        ? maps.map((e) => CartProductModel.fromJson(e)).toList()
        : []);
    return list;
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.update(Constants.tableCartProduct, model.toJson(),
        where: '${Constants.columnProductId}=?', whereArgs: [model.productId]);
  }
}
