import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;

  const UserEntity(this.id, this.firstName, this.lastName);

  @override
  List<Object?> get props => [id, firstName, lastName];
}
