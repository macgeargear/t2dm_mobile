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
    // print("id: ${json["user"]["_id"]}");
    // print("firstName: ${json["user"]["firstName"]}");
    // print("lastName: ${json["user"]["lastName"]}");
    // print("gender: ${json["user"]["gender"]}");
    // print("birthdate: ${json["user"]["birthdate"]}");
    // print("status: ${json["user"]["status"]}");
    return UserModel(
      id: json["user"]["_id"],
      firstname: json["user"]["firstName"],
      lastname: json["user"]["lastName"],
      gender: json["user"]["gender"],
      birthDate: json["user"]["birthdate"],
      profilePicture: "",
      status: json["user"]["status"],
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
