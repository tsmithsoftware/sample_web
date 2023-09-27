import 'package:flutter_calendar/core/error/exception.dart';
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';
import 'package:objectbox/objectbox.dart';

abstract class ScheduleLocalDataSource {
  Future<ScheduleModel> getSchedule(int id);

  Future<void> cacheSchedule(ScheduleModel scheduleToCache);
}

class ScheduleLocalDataSourceImpl extends ScheduleLocalDataSource {
  final Box<ScheduleModel> box;
  ScheduleLocalDataSourceImpl({required this.box});

  @override
  Future<void> cacheSchedule(ScheduleModel scheduleToCache) {
    int result = box.put(scheduleToCache);
    if (result == 0) {
      return Future.value();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<ScheduleModel> getSchedule(int id) {
    final retrievedItem = box.get(id);
    if (retrievedItem != null) {
      return Future.value(retrievedItem);
    } else {
      throw CacheException();
    }
  }
}
