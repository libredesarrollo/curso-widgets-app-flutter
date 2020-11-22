import 'package:rest_flutter/utils/key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_flutter/utils/user_preference.dart';

class BaseProvider {
  static const String _BASEURL = Key.BASEURL;

  Future<List> sendRequest(String token) async {

    final userPreference = UserPreference();

    Map<String, String> headers = {
      'accept' : 'application/json',
      'authorization' : userPreference.token
    };
    
    final res = await http.get(_BASEURL+token+"?format=json", headers: headers); //?format=json para django

    print(res.body);

    final data = json.decode(res.body);

    return jsonArrayToList(data['data']);
  }

  List jsonArrayToList(List<dynamic> jsonList){return null;}


}