import 'package:dartz/dartz.dart';
import 'package:flutter_calendar/core/error/failures.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, ScheduleEntity>> getSchedule(int id);
}
