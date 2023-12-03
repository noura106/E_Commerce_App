import 'package:flutter/material.dart';

class Constants {
  static const primaryColor = Color.fromRGBO(0, 197, 105, 1);
  static const String tableCartProduct = 'cartProduct';
  static const String columnName = 'name';
  static const String columnImage = 'image';
  static const String columnQuantity = 'quantity';
  static const String columnProductId = 'productId';
  static const String columnPrice = 'price';
  static const String CACHED_USER_DATA = 'user';
  static const kTileHeight = 50.0;
  static const inProgressColor = Colors.black87;
  static const todoColor = Color(0xffd1d2d7);


}
enum Pages {
  deliveryTime,
  addAddress,
  summary,
}