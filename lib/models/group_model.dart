
class GroupModel {
  int id;
  String name;

  GroupModel.constructor(String name){
    this.name = name;
  }

  GroupModel.fromJsonMapToObject(Map<String, dynamic> item){
    this.name = item['name'];
    this.id = item['id'];
  }

}