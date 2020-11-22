import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class ChipProvider extends BaseProvider {
  List<ChipModel> jsonArrayToList(List<dynamic> jsonList) {
    List<ChipModel> chipsModel = List();

    jsonList.forEach((item) {
      chipsModel.add(ChipModel.fromJsonMapToObject(item));
    });

    return chipsModel;
  }

  Future<List<ChipModel>> getChips() async {
    return await sendRequest('api/chip/all');
  }
}
