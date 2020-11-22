import 'package:flutter/material.dart';
import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/utils/behavior.dart';

class ChipWidget {
  static Widget build(ChipModel chipModel, BuildContext context) {
    return buildWidget(chipModel, context);
  }

  /*
  * Construir widget
   */

  static Widget buildWidget(ChipModel chipModel, BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (chipModel.behavior) {
            print("comportamiento");
            Behavior.process(chipModel.behaviorModel, context);
          }
        },
        child: Chip(
          backgroundColor: Color(int.parse(chipModel.colorBg, radix: 16)),
          avatar: CircleAvatar(
            backgroundColor: Color(int.parse(chipModel.colorIcon, radix: 16)),
            child: Icon(Icons.access_alarm),
          ), //Text("AC")
          label: Text(
            chipModel.label,
            style: TextStyle(
                color: Color(int.parse(chipModel.colorIcon, radix: 16))),
          ),
        ));
  }
}
