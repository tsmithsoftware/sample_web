import 'package:flutter_calendar/features/get_events/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({id, firstName, lastName}) : super(id, firstName, lastName);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstname'],
        lastName: json["lastname"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "firstName": firstName, "lastName": lastName};
  }
}
