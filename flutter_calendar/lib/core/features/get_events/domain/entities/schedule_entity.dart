import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/event_list_entity.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/user_entity.dart';

@immutable
class ScheduleEntity extends Equatable {
  final int id;
  final String scheduleName;
  final UserEntity user;
  final EventListEntity events;

  const ScheduleEntity(this.id, this.scheduleName, this.user, this.events);

  @override
  List<Object?> get props => [id, scheduleName];
}
