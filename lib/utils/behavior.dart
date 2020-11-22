
import 'package:flutter/cupertino.dart';
import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Behavior{
  static process(BehaviorModel behaviorModel, BuildContext context) async{

    switch (behaviorModel.behavioralModel) {
      case "url":
        print("URL");

        if(await canLaunch(behaviorModel.content1)){
          await launch(behaviorModel.content1);
        }

        break;
      case "resource":
        print("resource");
        Navigator.pushNamed(context, MixPage.ROUTE, arguments: behaviorModel.content1);
        break;
      case "content":
        print("content");
        break;
      default:
    }

  }
}