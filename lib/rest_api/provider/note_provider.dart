import 'package:rest_flutter/models/note_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NoteProvider {
  static const String _BASEURL = Key.BASEURL;
  static int lastPage = 0;

  static Future<List<NoteModel>> _sendRequest(String token) async {
    final res = await http.get(_BASEURL + token);

    print(res.body);

    final data = json.decode(res.body);
    lastPage = data['data']['last_page'];

    return _jsonArrayToList(data['data']['data']);
  }

  static List<NoteModel> _jsonArrayToList(List<dynamic> jsonList) {
    List<NoteModel> notesModel = List();

    jsonList.forEach((item) {
      notesModel.add(NoteModel.fromJsonMapToObject(item));
    });

    return notesModel;
  }

  static Future<List<NoteModel>> getNotes(page) async {
    return await _sendRequest('api/note?page=$page');
  }

  static deleteNote(int id) {
    http.delete(_BASEURL + 'api/note/$id');
  }

  static Future<Map> saveNote(String title, String content, [int id]) async {
    final form = {'title': title, 'content': content};
    final res = id is int
        ? await http.patch(_BASEURL + 'api/note/$id', body: form)
        : await http.post(_BASEURL + 'api/note', body: form);

    final data = json.decode(res.body);

    final code = data['code'];

    final map = {'code': code};

    if (code != 200) {
      // errors
      if (data['msj']['title'] != null) {
        map.addAll({'title': data['msj']['title'][0]});
      }
      if (data['msj']['content'] != null) {
        map.addAll({'content': data['msj']['content'][0]});
      }
    }

    print(map);

    return map;
  }
}
