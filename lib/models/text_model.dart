

import 'package:rest_flutter/widgets/text_widget.dart';

class TextModel {
  late String text;
  late Function fun;
  
  TextModel.constructor(String text){
    this.text = text;
    this.fun = TextWidget.build;
  }

  TextModel.fromJsonMapToObject(Map<String, dynamic> item){
    this.text = item['text'];
    this.fun = TextWidget.build;
  }

}