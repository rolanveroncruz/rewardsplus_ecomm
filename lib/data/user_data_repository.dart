import 'package:rewardsplus_ecomm/data/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';



class UserDataRepository{
  User? user;
  static final _instance = UserDataRepository();
  static getInstance() {
    return _instance;
  }

  UserDataRepository() {

  }
  User? getUser() {
    return user;
  }
}