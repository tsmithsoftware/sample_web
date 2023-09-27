import 'dart:convert';

import 'package:flutter_calendar/core/error/exception.dart';
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_local_data_source.dart';
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'schedule_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>()])
void main() {
  MockBox<ScheduleModel> mockBox = MockBox<ScheduleModel>();
  ScheduleLocalDataSource dataSource =
      ScheduleLocalDataSourceImpl(box: mockBox);

  group('getSchedule', () {
    final tScheduleModel =
        ScheduleModel.fromJson(json.decode(fixture('schedule.json')));

    test(
      'should return ScheduleModel from the box when there is one in the cache',
      () async {
        mockBox.get(tScheduleModel.id);
        when(mockBox.get(tScheduleModel.id)).thenReturn(tScheduleModel);

        final result = await dataSource.getSchedule(tScheduleModel.id);
        verify(mockBox.get(tScheduleModel.id));
        expect(result, equals(tScheduleModel));
      },
    );

    test('should throw a CacheException when there is not a cached value', () {
      when(mockBox.get(any)).thenReturn(null);
      final call = dataSource.getSchedule;
      expect(() => call(tScheduleModel.id),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheSchedule', () {
    final tScheduleModel =
        ScheduleModel.fromJson(json.decode(fixture('schedule.json')));

    test('should call box to cache the data', () async {
      // act
      await dataSource.cacheSchedule(tScheduleModel);
      // assert
      verify(mockBox.put(tScheduleModel));
    });

    test('should throw CacheExeception if error occurs when caching data',
        () async {
      when(mockBox.put(any)).thenReturn(1);
      final call = dataSource.cacheSchedule;
      expect(() => call(tScheduleModel),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });
}
