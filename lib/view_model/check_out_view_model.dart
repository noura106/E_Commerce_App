import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/core/constants/enum.dart';
import 'package:e_commerce_app_v2/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int _index = 0;

  int get index => _index;
  Pages _pages = Pages.deliveryTime;

  Pages get pages => _pages;
  String street1 = '';
  String street2 = '';
  String city = '';
  String country = '';
  String state = '';
  GlobalKey<FormState> globalKey = GlobalKey();

  Color getColor(int i) {
    if (i == _index) {
      return Constants.inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return Constants.todoColor;
    }
  }

  changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.deliveryTime;
      _index = i;
      update();
    } else if (i == 1) {
      _pages = Pages.addAddress;
      _index = i;
      update();
    } else if (i == 2) {
      globalKey.currentState!.save();
      if (globalKey.currentState!.validate()) {
        _pages = Pages.summary;
        _index = i;
        update();
      }
    } else if (i == 3) {
      Get.to(ControlView());
      _index = 0;
      update();
    }
  }
}
