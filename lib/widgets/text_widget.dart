import 'package:flutter/material.dart';
import 'package:rest_flutter/models/text_model.dart';

class TextWidget {

  static Widget build(TextModel textModel, BuildContext context) {
    return buildWidget(textModel, context);
  }

  /*
  * Construir widget
   */

  static Widget buildWidget(TextModel textModel, BuildContext context) {
    return Text(textModel.text);
  }

}
