import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';

abstract class ScheduleLocalDataSource {
  Future<ScheduleModel> getSchedule(int id);

  Future<void> cacheSchedule(ScheduleModel scheduleToCache);
}
