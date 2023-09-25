import 'package:flutter_calendar/features/get_events/domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel(id, eventName, startTime, endTime)
      : super(id, eventName, startTime, endTime);

  factory EventModel.fromJson(Map<String, dynamic> jsonMap) {
    return EventModel(
        jsonMap['id'],
        jsonMap['eventName'],
        DateTime.parse(jsonMap['startTime']),
        DateTime.parse(jsonMap['endTime']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventName': eventName,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String()
    };
  }
}
