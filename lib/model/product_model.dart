import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/core/helper/extinstion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String image;
  final String description;
  final String size;
  final Color color;
  final String price;
  final String productId;

  ProductModel({required this.name,
    required this.image,
    required this.size,
    required this.color,
    required this.productId,
    required this.price,
    required this.description});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(name: json['name'],
        image: json['image'],
        size: json['size'],
        color: HexColor.fromHex(json['color']),
        price: json['price'],
        productId: json['productId'],
        description: json['description']);
  }


  toJson(){
    return {
      'name':name,
      'image':image,
      'color':color,
      'price':price,
      'description':description,
      'size':size,
      'productId':productId
    };
  }
}
