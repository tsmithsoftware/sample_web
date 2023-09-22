import 'package:flutter_calendar/core/features/get_events/data/models/event_model.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/event_list_entity.dart';

class EventListModel extends EventListEntity {
  const EventListModel({required List<EventModel> events})
      : super(events: events);

  factory EventListModel.fromJson(List myEvents) {
    List<EventModel> convertedEvents = [];
    for (var element in myEvents) {
      convertedEvents.add(EventModel.fromJson(element));
    }
    return EventListModel(events: convertedEvents);
  }

  Map<String, dynamic> toJson() {
    return {"events": events.map(((e) => (e as EventModel).toJson())).toList()};
  }
}
