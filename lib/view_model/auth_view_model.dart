import 'package:e_commerce_app_v2/core/services/fire_srore_user.dart';
import 'package:e_commerce_app_v2/model/user_model.dart';
import 'package:e_commerce_app_v2/view/control_view.dart';
import 'package:e_commerce_app_v2/view/home/home_view.dart';
import 'package:e_commerce_app_v2/view_model/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  LocalStorageData localStorageData = Get.find();
  String? name;
  String email = '';
  String password = '';
  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void signInWithGoogleMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credentials = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    final UserCredential userCredential =
        await _auth.signInWithCredential(credentials);
    saveUser(userCredential);
    Get.offAll(ControlView());
  }

  void signInWithFaceBook() async {
    FacebookLoginResult facebookLoginResult =
        await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = facebookLoginResult.accessToken?.token;
    if (facebookLoginResult.status == FacebookLoginStatus.success) {
      final facebookCredentials = FacebookAuthProvider.credential(accessToken!);
      final UserCredential userCredential =
          await _auth.signInWithCredential(facebookCredentials);
      saveUser(userCredential);
      Get.offAll(ControlView());
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser.getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromJson(value.data() as Map<String, dynamic>));
        });
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveUser(userCredential);
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential userCredential) async {
    final UserModel user = UserModel(
        email: userCredential.user!.email!,
        pic: '',
        uid: userCredential.user!.uid,
        name: name ?? userCredential.user!.displayName!);
    await FireStoreUser.addUserToFireStore(user);
  }

  void setUser(UserModel user) async {
    await localStorageData.setUser(user);
  }
}
