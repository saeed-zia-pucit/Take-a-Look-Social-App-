
class UserModel {

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

  UserModel({
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
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    avatarUrl = json['avatarUrl'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    bio = json['bio'];
    license = json['license'];
  }

  Map<String, dynamic> get toJson => {
    'id' : id,
    'firstname' : firstname,
    'lastname' : lastname,
    'email' : email,
    'avatarUrl' : avatarUrl,
    'password' : password,
    'token' : token,
    'refreshToken' : refreshToken,
    'bio' : bio,
    'license' : license,
  };





  /// COMMON

  Map<String, dynamic> get toSignUpJson => {
    'firstname' : firstname,
    'lastname' : lastname,
    'email' : email,
    'password' : password,
  };

  Map<String, dynamic> get toSignInJson => {
    'email' : email,
    'password' : password,
  };

  UserModel.fromSignUp(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  UserModel.fromGetUser(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    bio = json['bio'];
    avatarUrl = json['avatarUrl'];
    license = json['license'];
  }

  UserModel.fromJsonFollow(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    bio = json['bio'];
    avatarUrl = json['avatarUrl'];
    license = json['license'];
  }

  UserModel copyWith({
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
  }) => UserModel(
    id: id ?? this.id,
    firstname : firstname ?? this.firstname,
    lastname : lastname ?? this.lastname,
    email : email ?? this.email,
    password : password ?? this.password,
    token: token ?? this.token,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    refreshToken: refreshToken ?? this.refreshToken,
    bio: bio ?? this.bio,
    license: license ?? this.license,
  );


}