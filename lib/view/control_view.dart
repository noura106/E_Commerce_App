import 'package:e_commerce_app_v2/view/auth/login_screen.dart';
import 'package:e_commerce_app_v2/view/home/home_view.dart';
import 'package:e_commerce_app_v2/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user != null
          ? HomeView()
          : LoginView();
    });
  }
}
