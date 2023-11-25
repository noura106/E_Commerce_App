import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_v2/model/user_model.dart';

class FireStoreUser {
 static final CollectionReference _userCollectionRef= FirebaseFirestore.instance.collection('Users');

  static Future<void> addUserToFireStore(UserModel userModel) async{
    return await _userCollectionRef.doc(userModel.uid).set(userModel.toJson());
  }
}