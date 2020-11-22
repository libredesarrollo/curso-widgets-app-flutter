import 'package:rest_flutter/models/group_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class GroupProvider extends BaseProvider{

  List<GroupModel> jsonArrayToList(List<dynamic> jsonList){
    List<GroupModel> groupsModel = List();

    jsonList.forEach((item) {
      groupsModel.add(GroupModel.fromJsonMapToObject(item));
    });

    return groupsModel;
  }

  Future<List<GroupModel>> getGroups() async{
    return await sendRequest('api/group/all');
  }

}