import 'package:flutter_calendar/core/features/get_events/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({id, firstName, lastName}) : super(id, firstName, lastName);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json["lastName"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "firstName": firstName, "lastName": lastName};
  }
}
