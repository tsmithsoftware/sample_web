import 'package:dartz/dartz.dart';
import 'package:flutter_calendar/core/error/failures.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/schedule_entity.dart';
import 'package:flutter_calendar/core/features/get_events/domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImplementation implements ScheduleRepository {
  @override
  Future<Either<Failure, ScheduleEntity>> getSchedule(int id) {
    throw UnimplementedError();
  }
}
