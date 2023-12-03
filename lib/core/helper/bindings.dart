import 'package:e_commerce_app_v2/view_model/auth_view_model.dart';
import 'package:e_commerce_app_v2/view_model/cart_view_model.dart';
import 'package:e_commerce_app_v2/view_model/check_out_view_model.dart';
import 'package:e_commerce_app_v2/view_model/control_view_model.dart';
import 'package:e_commerce_app_v2/view_model/home_view_model.dart';
import 'package:e_commerce_app_v2/view_model/local_storage_data.dart';
import 'package:e_commerce_app_v2/view_model/profile_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckOutViewModel());
  }

}