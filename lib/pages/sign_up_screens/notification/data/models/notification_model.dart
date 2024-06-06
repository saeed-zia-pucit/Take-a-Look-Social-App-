
class NotificationModel {

  String id = "";
  String type = "";
  bool isRead = false;
  String content = "";
  String subjectId = "";
  String createdAt = "2024-06-06T04:17:30.066Z";

  NotificationModel();

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    isRead = json['isRead'];
    content = json['content'];
    subjectId = json['subjectId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> get toJson => {
    "id" : id,
    "type" : type,
    "isRead" : isRead,
    "content" : content,
    "subjectId" : subjectId,
    "createdAt" : createdAt,
  };

}