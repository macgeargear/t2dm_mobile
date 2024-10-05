import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.firstname,
      required super.lastname,
      required super.gender,
      required super.profilePicture,
      required super.status,
      required super.birthDate});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json.containsKey("user") ? json["user"] : json["data"];
    return UserModel(
      id: data["_id"],
      firstname: data["firstName"],
      lastname: data["lastName"],
      gender: data["gender"],
      birthDate: data["birthdate"],
      profilePicture: "",
      status: data["status"],
    );
  }

  UserModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? birthDate,
    String? gender,
    String? profilePicture,
    String? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      profilePicture: profilePicture ?? this.profilePicture,
      status: status ?? this.status,
    );
  }
}
