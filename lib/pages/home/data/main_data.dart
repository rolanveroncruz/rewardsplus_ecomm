import 'dart:convert';
import 'package:http/http.dart';
import 'package:rewardsplus_ecomm/pages/home/data/item_model.dart';


class ItemRepository{
  String endpoint = "https://13.238.134.225/api/get_items";

  Future<List<ItemModel>> getItems () async {
    Response response = await post(Uri.parse(endpoint));
    if (response.statusCode==200) {
      final List result = jsonDecode(response.body)['results'];
      final returnValue = result.map(((e)=> ItemModel.fromJson(e))).toList();
      return returnValue;

    } else {
      throw Exception(response.reasonPhrase);
    }
  }




}