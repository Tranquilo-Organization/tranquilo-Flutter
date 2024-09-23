class ProfileResponseModel {
  final Model model;
  final int statusCode;

  ProfileResponseModel({required this.model, required this.statusCode});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        model: Model.fromJson(json['model']),
        statusCode: json['statusCode'],
      );
}

class Model {
  final String id;
  final String? profilePicture;
  final String nickName;
  final String userName;
  final String email;
  final String? levelName;

  Model({
    required this.id,
    this.profilePicture,
    required this.nickName,
    required this.userName,
    required this.email,
    this.levelName,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json['id'],
        nickName: json['nickName'],
        userName: json['userName'],
        email: json['email'],
        levelName: json['levelName'],
      );
}
