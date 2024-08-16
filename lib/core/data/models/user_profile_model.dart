class UserProfileModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? token;
  String? avatarUrl;
  String? refreshToken;
  String? bio;
  String? license;
  bool isFollowing = false;
  int followingCount;
  int followersCount;
  int postCount;

  UserProfileModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.avatarUrl,
    this.token,
    this.refreshToken,
    this.bio,
    this.license,
    this.followingCount = 0,
    this.followersCount = 0,
    this.postCount = 0,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : id = json['userAccount']['id'],
        firstname = json['userAccount']['firstname'],
        lastname = json['userAccount']['lastname'],
        email = json['userAccount']['email'], // Assuming email is part of the userAccount object
        password = json['userAccount']['password'], // Assuming password is part of the userAccount object
        avatarUrl = json['userAccount']['avatarUrl'],
        token = json['userAccount']['token'], // Assuming token is part of the userAccount object
        refreshToken = json['userAccount']['refreshToken'], // Assuming refreshToken is part of the userAccount object
        bio = json['userAccount']['bio'],
        license = json['userAccount']['license'],
        followingCount = json['followingCount'],
        followersCount = json['followersCount'],
        postCount = json['postCount'];

  Map<String, dynamic> get toJson => {
    'userAccount': {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'avatarUrl': avatarUrl,
      'bio': bio,
      'license': license,
    },
    'followingCount': followingCount,
    'followersCount': followersCount,
    'postCount': postCount,
  };

  UserProfileModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? token,
    String? refreshToken,
    String? avatarUrl,
    String? bio,
    String? license,
    int? followingCount,
    int? followersCount,
    int? postCount,
  }) => UserProfileModel(
    id: id ?? this.id,
    firstname: firstname ?? this.firstname,
    lastname: lastname ?? this.lastname,
    email: email ?? this.email,
    password: password ?? this.password,
    token: token ?? this.token,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    refreshToken: refreshToken ?? this.refreshToken,
    bio: bio ?? this.bio,
    license: license ?? this.license,
    followingCount: followingCount ?? this.followingCount,
    followersCount: followersCount ?? this.followersCount,
    postCount: postCount ?? this.postCount,
  );
}