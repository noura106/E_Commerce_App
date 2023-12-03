import 'package:e_commerce_app_v2/core/constants/contsants.dart';
import 'package:e_commerce_app_v2/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int _index = 0;

  int get index => _index;
  Pages _pages = Pages.deliveryTime;

  Pages get pages => _pages;

  Color getColor(int i) {
    if (i == _index) {
      return Constants.inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return Constants.todoColor;
    }
  }


  changeIndex(int i){
    _index=i;
    if(_index==1){
      _pages=Pages.addAddress;
      update();
    }else if (_index==2){
      _pages=Pages.summary;
      update();
    } else if (_index==3){
      Get.to(ControlView());
    }

  }
}
