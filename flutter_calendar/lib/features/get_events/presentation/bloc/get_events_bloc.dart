import 'package:bloc/bloc.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/schedule_entity.dart';
import 'package:meta/meta.dart';

part 'get_events_event.dart';
part 'get_events_state.dart';

class GetEventsBloc extends Bloc<GetEventsEvent, GetEventsState> {
  GetEventsBloc() : super(GetEventsInitial()) {
    on<GetEventsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
