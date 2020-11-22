import 'package:rest_flutter/models/mix_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MixProvider {
   static const String _BASEURL = Key.BASEURL;

  static Future<List<MixModel>> _sendRequest(String token) async {
    final res = await http.get(_BASEURL+token);

    print(res.body);

    final data = json.decode(res.body);

    return _jsonArrayToList(data['data']);
  }

  static List<MixModel> _jsonArrayToList(List<dynamic> jsonList){
    List<MixModel> mixsModel = List();

    jsonList.forEach((item) {
      mixsModel.add(MixModel.fromJsonMapToObject(item));
    });

    return mixsModel;
  }

  static Future<List<MixModel>> getMixs(int groupId) async{
    return await _sendRequest('api/mix/$groupId');
  }

    static Future<List<MixModel>> getMixsUrl(String url) async{
    return await _sendRequest(url);
  }

}