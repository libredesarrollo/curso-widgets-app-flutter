import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class PictureProvider extends BaseProvider {
  List<ImageModel> jsonArrayToList(List<dynamic> jsonList) {
    List<ImageModel> imagesModel = List();

    jsonList.forEach((item) {
      imagesModel.add(ImageModel.fromJsonMapToObject(item));
    });

    return imagesModel;
  }

  Future<List<ImageModel>> getImages() async {
    return await sendRequest('api/image/all');
  }
}
