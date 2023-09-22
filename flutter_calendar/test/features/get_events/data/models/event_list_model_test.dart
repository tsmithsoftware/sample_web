import 'dart:convert';

import 'package:flutter_calendar/core/features/get_events/data/models/event_list_model.dart';
import 'package:flutter_calendar/core/features/get_events/data/models/event_model.dart';
import 'package:flutter_calendar/core/features/get_events/domain/entities/event_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tEventListModel = EventListModel(events: [
    EventModel(1, "event1", DateTime.parse("2023-09-18T12:00:00.000Z"),
        DateTime.parse("2023-09-18T13:00:00.000Z")),
    EventModel(2, "event2", DateTime.parse("2023-09-18T14:00:00.000Z"),
        DateTime.parse("2023-09-18T15:00:00.000Z"))
  ]);

  test(
    'should be a subclass of EventEntity',
    () async {
      // assert
      expect(tEventListModel, isA<EventListEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('event_list_model.json'));
        // act
        final result = EventListModel.fromJson(jsonMap);
        // assert
        expect(result, tEventListModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tEventListModel.toJson();
        // assert
        final expectedJsonMap = {
          "events": [
            {
              "id": 1,
              "eventName": "event1",
              "startTime": "2023-09-18T12:00:00.000Z",
              "endTime": "2023-09-18T13:00:00.000Z"
            },
            {
              "id": 2,
              "eventName": "event2",
              "startTime": "2023-09-18T14:00:00.000Z",
              "endTime": "2023-09-18T15:00:00.000Z"
            }
          ]
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
