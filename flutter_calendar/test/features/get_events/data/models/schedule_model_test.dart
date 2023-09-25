import 'dart:convert';

import 'package:flutter_calendar/features/get_events/data/models/event_list_model.dart';
import 'package:flutter_calendar/features/get_events/data/models/event_model.dart';
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';
import 'package:flutter_calendar/features/get_events/data/models/user_model.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/schedule_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel(id: 1, firstName: "Bob", lastName: "Docker");
  final tEventsListModel = EventListModel(events: [
    EventModel(1, "event1", DateTime.parse("2023-09-18T12:00:00.000Z"),
        DateTime.parse("2023-09-18T13:00:00.000Z")),
    EventModel(2, "event2", DateTime.parse("2023-09-18T14:00:00.000Z"),
        DateTime.parse("2023-09-18T15:00:00.000Z"))
  ]);
  final tScheduleModel =
      ScheduleModel(1, "schedule1", tUserModel, tEventsListModel);

  test(
    'should be a subclass of ScheduleEntity',
    () async {
      // assert
      expect(tScheduleModel, isA<ScheduleEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('schedule.json'));
        // act
        final result = ScheduleModel.fromJson(jsonMap);
        // assert
        expect(result, tScheduleModel);
      },
    );
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final result = tScheduleModel.toJson();
      final expectedJsonMap = {};
      expect(result, expectedJsonMap);
    });
  });
}
