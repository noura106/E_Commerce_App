import 'package:e_commerce_app_v2/model/user_model.dart';
import 'package:e_commerce_app_v2/view_model/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  getCurrentUser() async {
    _isLoading.value=true;
    UserModel? userModel = await localStorageData.getUserData();
    _userModel = userModel;
    _isLoading.value=false;
    update();
  }

  LocalStorageData localStorageData = Get.find();

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    await localStorageData.deleteUser();
  }
}
