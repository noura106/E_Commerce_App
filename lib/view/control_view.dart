import 'package:e_commerce_app_v2/core/constants/app_svg.dart';
import 'package:e_commerce_app_v2/view/auth/login_screen.dart';
import 'package:e_commerce_app_v2/view/cart_view.dart';
import 'package:e_commerce_app_v2/view/home/home_view.dart';
import 'package:e_commerce_app_v2/view/profile_view.dart';
import 'package:e_commerce_app_v2/view_model/auth_view_model.dart';
import 'package:e_commerce_app_v2/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? const LoginView()
          : Scaffold(
              body: GetBuilder<ControlViewModel>(
                init: ControlViewModel(),
                builder: (controller) {
                  return Scaffold(
                    body: controller.currentScreen,
                  );
                },
              ),
              bottomNavigationBar: bottomNavigationBar(),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
        builder: (controller) {
          return BottomNavigationBar(
              onTap: (int value) {
                controller.changeSelectedNavigatorValue(value);
              },
              elevation: 0,
              backgroundColor: Colors.grey.shade50,
              selectedItemColor: Colors.black,
              currentIndex: controller.navigatorValue,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(AppSvg.explore,
                          fit: BoxFit.contain, width: 20),
                    ),
                    label: '',
                    activeIcon: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Explore'),
                    )),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SvgPicture.asset(AppSvg.cart,
                        fit: BoxFit.contain, width: 20),
                  ),
                  label: '',
                  activeIcon: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Cart'),
                  ),
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SvgPicture.asset(AppSvg.person,
                          fit: BoxFit.contain, width: 20),
                    ),
                    label: '',
                    activeIcon: const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Person'),
                    )),
              ]);
        });
  }
}
