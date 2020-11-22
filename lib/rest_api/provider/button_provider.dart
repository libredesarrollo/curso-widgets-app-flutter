import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class ButtonProvider extends BaseProvider {
  List<ButtonModel> jsonArrayToList(List<dynamic> jsonList) {
    List<ButtonModel> buttonsModel = List();

    jsonList.forEach((item) {
      buttonsModel.add(ButtonModel.fromJsonMapToObject(item));
    });

    return buttonsModel;
  }

  Future<List<ButtonModel>> getButtons() async {
    return await sendRequest('api/button/all');
  }
}
