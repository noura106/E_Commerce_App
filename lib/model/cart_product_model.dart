class CartProductModel {
  final String name;

  final String image;
  final String productId;

  final String price;
   int quantity;

  CartProductModel(
      {required this.name,
      required this.image,
        required this.productId,
      required this.price,
      required this.quantity});

  factory CartProductModel.fromJson(Map<dynamic, dynamic> json) {
    return CartProductModel(
        name: json['name'],
        image: json['image'],
        productId: json['productId'],
        price: json['price'],
        quantity: json['quantity']);
  }
  toJson(){
    return {
      'name': name,
      'image': image,
      'price':price,
      'quantity':quantity,
      'productId':productId
    };
  }

}
