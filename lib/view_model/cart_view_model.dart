import 'package:e_commerce_app_v2/core/services/data_base/cart_data_base_helper.dart';
import 'package:e_commerce_app_v2/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;
  List<CartProductModel> _cartProducts = [];

  List<CartProductModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  int _quantity = 0;

  int get quantity => _quantity;
  var dbHelper = CartDataBaseHelper.db;
  CartViewModel() {
    getAllProducts();
  }

  addProductToCart(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].productId == cartProductModel.productId) {
        return;
      }
    }
    dbHelper.insert(cartProductModel);
    _cartProducts.add(cartProductModel);
    _totalPrice += double.parse((cartProductModel.price)) *
        cartProductModel.quantity.toDouble();

    update();
  }

  getAllProducts() async {
    _loading.value = true;
    _cartProducts = (await dbHelper.getAllProducts());
    print('cart length ${_cartProducts.length}');
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() async {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalPrice += double.parse((_cartProducts[i].price)) *
          _cartProducts[i].quantity.toDouble();
      print('total price $_totalPrice');
      update();
    }
  }
  increaseQuantity(int index)async{
    _cartProducts[index].quantity++;
    _totalPrice += double.parse((_cartProducts[index].price));
    await dbHelper.updateProduct(cartProducts[index]);
    update();

  }
  decreaseQuantity(int index) async{
    _cartProducts[index].quantity--;
    _totalPrice -= double.parse((_cartProducts[index].price));
    await dbHelper.updateProduct(cartProducts[index]);
    update();

  }
}
