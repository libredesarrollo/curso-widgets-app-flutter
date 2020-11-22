

import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'package:rest_flutter/widgets/button_widget.dart';

class ButtonModel {
  String text;
  String colorBg;
  String color;
  String type;
  bool behavior;
  BehaviorModel behaviorModel;
  Function fun;
  
  ButtonModel.constructor(String text, String colorBg,String color, String type){
    this.colorBg = colorBg;
    this.text = text;
    this.type = type;
    this.color = color;
    this.fun = ButtonWidget.build;
  }

  ButtonModel.fromJsonMapToObject(Map<String, dynamic> item){
    this.colorBg = item['color_bg'].replaceFirst("#","FF");
    this.text = item['label'];
    this.type = item['type'];
    this.color = item['color'].replaceFirst("#","FF");

    this.behavior = Key.RESTBACKEND == "laravel"
    ? item['behavioral_id'] != null
    : item['behavior'].length > 0;

    if(this.behavior){
      this.behaviorModel = BehaviorModel.fromJsonMapToObject(item);
    }

    this.fun = ButtonWidget.build;
  }

}