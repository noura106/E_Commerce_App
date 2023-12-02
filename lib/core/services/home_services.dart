import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  static final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Caregories');
  static final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  static Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }
  static Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }
}
