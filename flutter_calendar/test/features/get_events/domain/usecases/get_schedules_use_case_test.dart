import 'package:dartz/dartz.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/schedule_entity.dart';
import 'package:flutter_calendar/features/get_events/domain/repositories/schedule_repository.dart';
import 'package:flutter_calendar/features/get_events/domain/usecases/get_schedule_use_case.dart';
import 'package:flutter_calendar/core/usecases/usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_schedules_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ScheduleRepository>()])
@GenerateNiceMocks([MockSpec<ScheduleEntity>()])
void main() {
  MockScheduleEntity mockScheduleEntity = MockScheduleEntity();
  MockScheduleRepository mockScheduleRepository = MockScheduleRepository();
  GetScheduleUseCase usecase = GetScheduleUseCase(mockScheduleRepository);

  test(
    'should get schedule for the scheduleid from the repository',
    () async {
      GetScheduleParams noParams = const GetScheduleParams(id: 1);
      when(mockScheduleRepository.getSchedule(1))
          .thenAnswer((_) async => Right(mockScheduleEntity));
      final result = await usecase(noParams);
      expect(result, Right(mockScheduleEntity));
      verify(mockScheduleRepository.getSchedule(1));
      verifyNoMoreInteractions(mockScheduleRepository);
    },
  );
}
