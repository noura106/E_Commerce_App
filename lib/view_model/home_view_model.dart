import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_v2/core/services/home_services.dart';
import 'package:e_commerce_app_v2/model/category_model.dart';
import 'package:e_commerce_app_v2/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;

  HomeViewModel() {
    getCategories();
    getProducts();
  }

  getCategories() {
    _loading.value = true;
   HomeServices.getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categories.add(CategoryModel.fromJson(
            value[i].data() as Map<String, dynamic>));
      }
      print(_categories.length);
      _loading.value = false;
      update();
    });
  }
  getProducts() {
    _loading.value = true;
    HomeServices.getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _products.add(ProductModel.fromJson(
            value[i].data() as Map<String, dynamic>));
      }
      print(_products.length);
      _loading.value = false;
      update();
    });
  }
}
