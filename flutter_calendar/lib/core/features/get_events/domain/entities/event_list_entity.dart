import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/event_entity.dart';

@immutable
class EventListEntity extends Equatable {
  final List<EventEntity> events;

  const EventListEntity({required this.events});

  @override
  List<Object?> get props => [events];
}
