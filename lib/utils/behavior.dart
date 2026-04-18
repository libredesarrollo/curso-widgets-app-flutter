
import 'package:flutter/cupertino.dart';
import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Behavior{
  static process(BehaviorModel behaviorModel, BuildContext context) async{

    switch (behaviorModel.behavioralModel) {
      case "url":
        print("URL");

        final uri = Uri.parse(behaviorModel.content1);
        if(await canLaunchUrl(uri)){
          await launchUrl(uri);
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