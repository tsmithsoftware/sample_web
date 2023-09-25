import 'dart:convert';

import 'package:flutter_calendar/features/get_events/data/models/user_model.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel(id: 1, firstName: "tom", lastName: "jones");

  test('should be a subclass of UserEntity', () {
    expect(tUserModel, isA<UserEntity>());
  });

  group('fromJson', () {
    test('formJson returns valid model', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
      // act
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tUserModel.toJson();
        // assert
        final expectedJsonMap = {
          "id": 1,
          "firstName": "tom",
          "lastName": "jones"
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
