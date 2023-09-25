import 'package:dartz/dartz.dart';
import 'package:flutter_calendar/core/error/failures.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/schedule_entity.dart';
import 'package:flutter_calendar/features/get_events/domain/repositories/schedule_repository.dart';
import 'package:flutter_calendar/core/usecases/usecase.dart';

class GetScheduleUseCase extends UseCase<ScheduleEntity, GetScheduleParams> {
  final ScheduleRepository scheduleRepository;

  GetScheduleUseCase(this.scheduleRepository);

  @override
  Future<Either<Failure, ScheduleEntity>> call(GetScheduleParams params) async {
    return scheduleRepository.getSchedule(params.id);
  }
}
