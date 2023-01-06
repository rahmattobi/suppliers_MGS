class UserModel {
  int? id;
  String? username;
  String? profileName;
  String? token;

  UserModel({
    this.id,
    this.username,
    this.profileName,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    username = json?['username'];
    profileName = json?['profileName'];
    token = json?['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'profileName': profileName,
      'token': token,
    };
  }
}
