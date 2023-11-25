class UserModel {
  final String email;
  final String? name;
  final String uid;
  final String pic;

  UserModel({required this.email, this.name, required this.pic, required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        pic: json['pic'],
        uid: json['userId'],
        name: json['name'] != null ? json['name'] as String : null);
  }
  toJson(){
    return {
      'userId':uid,
      'email':email,
      'pic':pic,
      'name':name
    };
  }
}
