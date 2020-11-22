import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class TextProvider extends BaseProvider {
  List<TextModel> jsonArrayToList(List<dynamic> jsonList) {
    List<TextModel> textsModel = List();

    jsonList.forEach((item) {
      textsModel.add(TextModel.fromJsonMapToObject(item));
    });

    return textsModel;
  }

  Future<List<TextModel>> getTexts() async {
    return await sendRequest('api/text/all');
  }
}
