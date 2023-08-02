import 'dart:convert';

import 'package:http/http.dart';
import 'package:rewardsplus_ecomm/data/data_repository.dart';
import 'package:rewardsplus_ecomm/data/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';



class UserDataRepository{
  User? user;
  static final _instance = UserDataRepository();
  static getInstance() {
    return _instance;
  }

  User? getUser() {
    return user;
  }

  Future<(int, User?, String?)> signIn(String email, String password) async {
    String endpoint = "${DataRepository.baseURL}signin";
    var payload = jsonEncode({"email": email, "password": password});
    Response response = await post(Uri.parse(endpoint),body:payload  );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final User user = User.fromJson(json['data']);
      return (0, user, null);
    } else {
      var errorMsg = response.body;
      return ((-1, null, errorMsg));
    }
  }
}