import 'package:dartz/dartz.dart';
import 'package:flutter_calendar/core/error/exception.dart';
import 'package:flutter_calendar/core/error/failures.dart';
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_local_data_source.dart';
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_remote_data_source.dart';
import 'package:flutter_calendar/features/get_events/data/models/event_list_model.dart';
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';
import 'package:flutter_calendar/features/get_events/data/models/user_model.dart';
import 'package:flutter_calendar/features/get_events/data/repositories/schedule_repository_implementation.dart';
import 'package:flutter_calendar/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'schedule_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ScheduleRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<ScheduleLocalDataSource>()])
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
@GenerateNiceMocks([MockSpec<UserModel>()])
@GenerateNiceMocks([MockSpec<EventListModel>()])
void main() {
  MockScheduleRemoteDataSource mockRemoteDataSource =
      MockScheduleRemoteDataSource();
  MockScheduleLocalDataSource mockLocalDataSource =
      MockScheduleLocalDataSource();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  ScheduleRepositoryImplementation repository =
      ScheduleRepositoryImplementation(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkInfo,
  );

  group('getSchedule', () {
    const tNumber = 1;
    MockUserModel mockUserModel = MockUserModel();
    MockEventListModel mockEventListModel = MockEventListModel();
    ScheduleModel tScheduleModel =
        ScheduleModel(1, "ScheduleOne", mockUserModel, mockEventListModel);
    test('should check if device is online', () {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repository.getSchedule(tNumber);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getSchedule(tNumber))
              .thenAnswer((_) async => tScheduleModel);
          // act
          final result = await repository.getSchedule(tNumber);
          // assert
          verify(mockRemoteDataSource.getSchedule(tNumber));
          expect(result, equals(Right(tScheduleModel)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getSchedule(tNumber))
              .thenAnswer((_) async => tScheduleModel);
          // act
          await repository.getSchedule(tNumber);
          // assert
          verify(mockRemoteDataSource.getSchedule(tNumber));
          verify(mockLocalDataSource.cacheSchedule(tScheduleModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          reset(mockRemoteDataSource);
          when(mockRemoteDataSource.getSchedule(tNumber))
              .thenThrow(ServerException());
          // act
          final result = await repository.getSchedule(tNumber);
          // assert
          verify(mockRemoteDataSource.getSchedule(tNumber));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getSchedule(tNumber))
              .thenAnswer((_) async => tScheduleModel);
          // act
          final result = await repository.getSchedule(tNumber);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getSchedule(tNumber));
          expect(result, equals(Right(tScheduleModel)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getSchedule(tNumber))
              .thenThrow(CacheException());
          // act
          final result = await repository.getSchedule(tNumber);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getSchedule(tNumber));
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
