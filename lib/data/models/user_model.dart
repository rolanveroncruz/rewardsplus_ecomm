class User{
  int? id;
  final String uuid;
  String? emailOrPhone;
  String? name;

  User({this.id, this.emailOrPhone, required this.uuid, this.name});
  factory User.fromJson(Map<String, dynamic>json){
    return User(
        id: json['id'],
        emailOrPhone:json['email'],
        uuid: json['uuid'],
        name: json['name']);
  }
}