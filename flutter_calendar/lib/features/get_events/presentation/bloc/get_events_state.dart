part of 'get_events_bloc.dart';

@immutable
sealed class GetEventsState {}

final class GetEventsInitial extends GetEventsState {}

final class GetEventsLoading extends GetEventsState {}

final class GetEventsLoaded extends GetEventsState {
  final ScheduleEntity schedule;

  GetEventsLoaded({required this.schedule});
}

final class GetEventsError extends GetEventsState {
  final String message;

  GetEventsError({required this.message});
}
