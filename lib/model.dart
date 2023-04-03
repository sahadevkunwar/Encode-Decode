class UserModel {
  late String id;
  late String fullname;
  late String email;
  UserModel({required this.id, required this.fullname, required this.email});

  //Object to map
  Map<String, dynamic> toMap() {
    return {'id': id, 'fullname': fullname, 'email': email};
  }

  //Map to object
  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    fullname = map['fullname'];
    email = map['email'];
  }
}
