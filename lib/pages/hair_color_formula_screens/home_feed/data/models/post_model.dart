class PostModel {
  String postId = "";
  String content = "";
  String additionalUrl = "";
  String additionalNote = "";
  String imageUrl = "";
  String createdAt = "";
  String authorId = "";
  String authorFirstname = "";
  String category = "";
  String authorLastname = "";
  String authorImageUrl = "";
  int commentsCount = 0;
  int likesCount = 0;

  PostModel({
    this.postId = "",
    this.content = "",
    this.additionalUrl = "",
    this.additionalNote = "",
    this.imageUrl = "",
    this.createdAt = "",
    this.authorId = "",
    this.authorFirstname = "",
    this.category = "",
    this.authorLastname = "",
    this.authorImageUrl = "",
    this.commentsCount = 0,
    this.likesCount = 0,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    content = json['content'];
    additionalUrl = json['additionalUrl'];
    additionalNote = json['additionalNote'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    authorId = json['authorId'];
    category = json['category'];
    authorFirstname = json['authorFirstname'];
    authorLastname = json['authorLastname'];
    commentsCount = json['commentsCount'];
    likesCount = json['likesCount'];
    authorImageUrl = json['authorImageUrl'];
  }

  Map<String, dynamic> get toJson => {
    'postId': postId,
    'content': content,
    'additionalUrl': additionalUrl,
    'additionalNote': additionalNote,
    'imageUrl': imageUrl,
    'createdAt': createdAt,
    'authorId': authorId,
    'category': category,
    'authorFirstname': authorFirstname,
    'authorLastname': authorLastname,
    'commentsCount': commentsCount,
    'likesCount': likesCount,
    'authorImageUrl': authorImageUrl,
  };
}