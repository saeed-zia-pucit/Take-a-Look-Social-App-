class CommentResponse {
  String id;
  String userId;
  String firstname;
  String lastname;
  String avatarUrl;
  String content;
  String createdAt;
  int likesCount;

  CommentResponse({
    required this.id,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.avatarUrl,
    required this.content,
    required this.createdAt,
    required this.likesCount,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    return CommentResponse(
      id: json['id'],
      userId: json['userId'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      avatarUrl: json['avatarUrl'],
      content: json['content'],
      createdAt: json['createdAt'],
      likesCount: json['likesCount'],
    );
  }
}