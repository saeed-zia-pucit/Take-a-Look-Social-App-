
class NoteModel {

  String? id = "";
  String? title = "";
  String? content = "";
  String? createdAt = "";
  String? updateAt = "";

  NoteModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updateAt,
  });

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> get toJson => {
    'id' : id,
    'title' : title,
    'content' : content,
    'createdAt' : createdAt,
    'updateAt' : updateAt,
  };


  /// Common
  Map<String, dynamic> get toJsonAddNote => {
    'title' : title,
    'content' : content,
  };
}