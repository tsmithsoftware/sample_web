import 'package:flutter_calendar/core/features/get_events/data/models/event_list_model.dart';
import 'package:flutter_calendar/core/features/get_events/data/models/user_model.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/schedule_entity.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel(id, scheduleName, user, events)
      : super(id, scheduleName, user, events);

  factory ScheduleModel.fromJson(Map<String, dynamic> jsonMap) {
    return ScheduleModel(
        jsonMap["id"],
        jsonMap["schedulename"],
        UserModel.fromJson(jsonMap["user"]),
        EventListModel.fromJson(jsonMap["events"]));
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
