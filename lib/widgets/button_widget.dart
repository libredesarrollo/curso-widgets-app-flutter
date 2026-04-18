import 'package:flutter/material.dart';
import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/utils/behavior.dart';

class ButtonWidget {
  //static final ButtonModel buttonModel;

  //const ButtonWidget(this.buttonModel);
  
  static Widget build(ButtonModel buttonModel, BuildContext context) {
    return buildWidget(buttonModel, context);
  }

  /*
  * Construir widget
   */

  static Widget buildWidget(ButtonModel buttonModel, BuildContext context) {

    switch(buttonModel.type){
      case "flat":
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(int.parse(buttonModel.colorBg, radix: 16)),
          foregroundColor: Color(int.parse(buttonModel.color, radix: 16)),
        ),
        child: Text(buttonModel.text),
        onPressed: (){
          if(buttonModel.behavior){
            print("comportamiento");
            Behavior.process(buttonModel.behaviorModel!, context);
          }
        },
      );
      //case "raised":
      default:
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(int.parse(buttonModel.colorBg, radix: 16)),
          foregroundColor: Color(int.parse(buttonModel.color, radix: 16)),
        ),
        child: Text(buttonModel.text),
        onPressed: (){
          if(buttonModel.behavior){
            print("comportamiento");
            Behavior.process(buttonModel.behaviorModel!, context);
          }
        },
      );
    }

  }

}
