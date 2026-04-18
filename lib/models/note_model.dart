

class NoteModel {
  late int id;
  late String title;
  late String content;

  NoteModel.empty();

  NoteModel.fromJsonMapToObject(Map<String, dynamic> item){
    this.id = item['id'];
    this.title = item['title'];
    this.content = item['content'];
  }

}