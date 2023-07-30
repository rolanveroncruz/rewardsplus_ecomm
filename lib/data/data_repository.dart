import 'package:rewardsplus_ecomm/data/item_data_repository.dart';
import 'package:rewardsplus_ecomm/data/user_data_repository.dart';


class DataRepository{
  static const baseURL = "https://13.238.134.225/api/";
  var itemDataRepository = ItemDataRepository.getInstance();
  UserDataRepository userDataRepository = UserDataRepository.getInstance();
}




