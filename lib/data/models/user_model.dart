class User{
  int? id;
  final String uuid;
  String? email_or_phone;
  String? name;

  User({required this.uuid});
  factory User.fromJson(Map<String, dynamic>json){
    return User(uuid: json['uuid']);
  }
}