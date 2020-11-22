import 'package:flutter/material.dart';
import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/utils/behavior.dart';

class ImageWidget {
  static Widget build(ImageModel imageModel, BuildContext context) {
    return buildWidget(imageModel, context);
  }

  /*
  * Construir widget
   */

  static Widget buildWidget(ImageModel imageModel, BuildContext context) {
    return GestureDetector(
        onTap: () {
           if(imageModel.behavior){
            print("comportamiento");
            Behavior.process(imageModel.behaviorModel, context);
          }
        },
        child: FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage(imageModel.url),
        ));
  }
}
