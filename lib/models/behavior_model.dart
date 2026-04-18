import 'package:rest_flutter/utils/key.dart';

class BehaviorModel {
  late int behavioralId;
  late String behavioralType;
  late String behavioralModel;
  late String content1;
  late String content2;

  BehaviorModel.fromJsonMapToObject(Map<String, dynamic> item){

    if(Key.RESTBACKEND == "laravel"){
    this.behavioralId = item['behavioral_id'];
    this.behavioralType = item['behavioral_type'];
    this.behavioralModel = item['behavioral_model'];
    this.content1 = item['content1'];
    this.content2 = item['content2'];
    } else {
         this.behavioralId = item['behavior'][0]['behavioral_id'];
    this.behavioralType = item['behavior'][0]['behavioral_type'];
    this.behavioralModel = item['behavior'][0]['behavioral_model'];
    this.content1 = item['behavior'][0]['content_1'];
    this.content2 = item['behavior'][0]['content_2']; 
    }


  }

}