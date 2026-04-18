
class GroupModel {
  late int id;
  late String name;

  GroupModel.constructor(String name){
    this.name = name;
  }

  GroupModel.fromJsonMapToObject(Map<String, dynamic> item){
    this.name = item['name'];
    this.id = item['id'];
  }

}