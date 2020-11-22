import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'package:rest_flutter/widgets/chip_widget.dart';

class ChipModel {
  String colorIcon;
  String colorBg;
  String label;
  String icon;
  bool behavior;
  BehaviorModel behaviorModel;
  Function fun;

  ChipModel.constructor(
      String colorIcon, String colorBg, String label, String icon) {
    this.colorBg = colorBg;
    this.colorIcon = colorIcon;
    this.label = label;
    this.icon = icon;
    this.fun = ChipWidget.build;
  }

  ChipModel.fromJsonMapToObject(Map<String, dynamic> item) {
    this.colorBg = item['color_bg'].replaceFirst("#", "FF");
    this.label = item['label'];
    this.icon = item['icon'];
    this.colorIcon = item['color'].replaceFirst("#", "FF");

    this.behavior = Key.RESTBACKEND == "laravel"
        ? item['behavioral_id'] != null
        : item['behavior'].length > 0;

    if (this.behavior) {
      this.behaviorModel = BehaviorModel.fromJsonMapToObject(item);
    }

    this.fun = ChipWidget.build;
  }
}
