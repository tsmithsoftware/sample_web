import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class EventEntity extends Equatable {
  final int id;
  final String eventName;
  final DateTime startTime;
  final DateTime endTime;

  const EventEntity(this.id, this.eventName, this.startTime, this.endTime);

  @override
  List<Object?> get props => [id, eventName, startTime, endTime];
}
