import 'package:e_commerce_app_v2/view/cart_view.dart';
import 'package:e_commerce_app_v2/view/home/home_view.dart';
import 'package:e_commerce_app_v2/view/profile_view.dart';
import 'package:e_commerce_app_v2/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeView();

  Widget get currentScreen => _currentScreen;

  int get navigatorValue => _navigatorValue;

  void changeSelectedNavigatorValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = const CartView();
        break;
      case 2:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
}
