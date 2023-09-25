import 'dart:convert';

import 'package:flutter_calendar/features/get_events/data/models/event_model.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/event_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tEventModel = EventModel(
      1,
      "testEvent",
      DateTime.parse("2023-09-18T12:00:00.000Z"),
      DateTime.parse("2023-09-18T13:00:00.000Z"));

  test(
    'should be a subclass of EventEntity',
    () async {
      // assert
      expect(tEventModel, isA<EventEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('event.json'));
        // act
        final result = EventModel.fromJson(jsonMap);
        // assert
        expect(result.id, tEventModel.id);
        expect(result.eventName, tEventModel.eventName);
        expect(result.startTime, DateTime.parse("2023-09-18T12:00:00.000Z"));
        expect(result.endTime, DateTime.parse("2023-09-18T13:00:00.000Z"));
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tEventModel.toJson();
        // assert
        final expectedJsonMap = {
          "id": 1,
          "eventName": "testEvent",
          "startTime": "2023-09-18T12:00:00.000Z",
          "endTime": "2023-09-18T13:00:00.000Z"
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
