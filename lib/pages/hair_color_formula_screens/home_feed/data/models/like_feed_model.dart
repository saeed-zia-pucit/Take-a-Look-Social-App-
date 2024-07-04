class LikeInfo {
  List<LikedBy> likedBy;

  LikeInfo({required this.likedBy});

  factory LikeInfo.fromJson(Map<String, dynamic> json) {
    return LikeInfo(
      likedBy: (json['likedBy'] as List)
          .map((i) => LikedBy.fromJson(i))
          .toList(),
    );
  }
}

class LikedBy {
  String userId;
  String firstname;
  String lastname;
  String avatarUrl;

  LikedBy({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.avatarUrl,
  });

  factory LikedBy.fromJson(Map<String, dynamic> json) {
    return LikedBy(
      userId: json['userId'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      avatarUrl: json['avatarUrl'],
    );
  }
}