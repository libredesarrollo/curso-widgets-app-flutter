

import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/widgets/button_widget.dart';
import 'package:rest_flutter/widgets/chip_widget.dart';
import 'package:rest_flutter/widgets/image_widget.dart';
import 'package:rest_flutter/widgets/text_widget.dart';

class MixModel {
  String widget;
  Object object;  
  Function fun;
  
  MixModel.constructor(String widget){
    this.widget = widget;
  }

  MixModel.fromJsonMapToObject(Map<String, dynamic> item){
    this.widget = item['widget'];

    switch (this.widget) {
      case "button":
        this.fun = ButtonWidget.build;
        this.object = ButtonModel.fromJsonMapToObject(item);
        break;
      case "text":
        this.fun = TextWidget.build;
        this.object = TextModel.fromJsonMapToObject(item);
        break;
      case "image":
        this.fun = ImageWidget.build;
        this.object = ImageModel.fromJsonMapToObject(item);
        break;
      case "chip":
        this.fun = ChipWidget.build;
        this.object = ChipModel.fromJsonMapToObject(item);
        break;
    }

  }

}