import 'dart:convert';

import 'package:flutter_calendar/core/error/exception.dart';
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_remote_data_source.dart';
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'schedule_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  MockClient mockHttpClient = MockClient();
  ScheduleRemoteDataSourceImpl dataSource =
      ScheduleRemoteDataSourceImpl(client: mockHttpClient);

  group('getSchedule', () {
    const tScheduleId = 1;
    var tScheduleModel =
        ScheduleModel.fromJson(json.decode(fixture('schedule.json')));

    void setUpMockHttpClientSuccess200() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('schedule.json'), 200),
      );
    }

    void setUpMockHttpClientFailure404() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
    }

    test(
      'should perform a GET request on a URL with scheduleId being the endpoint and with application/json header',
      () {
        //arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('schedule.json'), 200),
        );
        // act
        dataSource.getSchedule(tScheduleId);
        // assert
        verify(mockHttpClient.get(
          Uri.parse('http://localhost:4002/schedules/$tScheduleId'),
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return ScheduleModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getSchedule(tScheduleId);
        // assert
        expect(result, equals(tScheduleModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getSchedule;
        // assert
        expect(() => call(tScheduleId),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
