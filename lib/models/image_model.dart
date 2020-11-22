import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'package:rest_flutter/widgets/image_widget.dart';

class ImageModel {
  String url;
  String name;
  bool behavior;
  BehaviorModel behaviorModel;
  Function fun;

  ImageModel.constructor(String url) {
    this.url = url;
    this.fun = ImageWidget.build;
  }

  ImageModel.fromJsonMapToObject(Map<String, dynamic> item) {
    //this.url = Key.BASEURL+"images/"+item['url']; // old
    this.url = Key.RESTBACKEND == "django"
        ? Key.BASEURL.substring(0, Key.BASEURL.length - 1)
        : Key.BASEURL + "images/"; // django

    this.url += item['url'].toString();

    this.behavior = Key.RESTBACKEND == "laravel"
        ? item['behavioral_id'] != null
        : item['behavior'].length > 0;

    if (this.behavior) {
      this.behaviorModel = BehaviorModel.fromJsonMapToObject(item);
    }

    this.fun = ImageWidget.build;
  }
}
