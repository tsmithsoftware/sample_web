import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';

abstract class ScheduleRemoteDataSource {
  Future<ScheduleModel> getSchedule(int id);
}
