import 'dart:convert';
import 'package:http/http.dart';
import 'package:rewardsplus_ecomm/data/models/item_model.dart';

import 'data_repository.dart';


class ItemDataRepository {
  static final ItemDataRepository _instance = ItemDataRepository();
  static getInstance() {
    return _instance;
  }
  String endpoint = "${DataRepository.baseURL}get_items";

  Future<List<ItemModel>> getItems() async {
    Response response = await post(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      final returnValue = result.map(((e) => ItemModel.fromJson(e))).toList();
      return returnValue;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}