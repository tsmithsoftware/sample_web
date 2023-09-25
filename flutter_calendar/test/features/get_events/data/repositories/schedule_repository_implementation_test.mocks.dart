// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_calendar/test/features/get_events/data/repositories/schedule_repository_implementation_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_calendar/core/platform/network_info.dart' as _i6;
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_local_data_source.dart'
    as _i5;
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_remote_data_source.dart'
    as _i3;
import 'package:flutter_calendar/features/get_events/data/models/event_list_model.dart'
    as _i8;
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart'
    as _i2;
import 'package:flutter_calendar/features/get_events/data/models/user_model.dart'
    as _i7;
import 'package:flutter_calendar/features/get_events/domain/entities/event_entity.dart'
    as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeScheduleModel_0 extends _i1.SmartFake implements _i2.ScheduleModel {
  _FakeScheduleModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ScheduleRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockScheduleRemoteDataSource extends _i1.Mock
    implements _i3.ScheduleRemoteDataSource {
  @override
  _i4.Future<_i2.ScheduleModel> getSchedule(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getSchedule,
          [id],
        ),
        returnValue: _i4.Future<_i2.ScheduleModel>.value(_FakeScheduleModel_0(
          this,
          Invocation.method(
            #getSchedule,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.ScheduleModel>.value(_FakeScheduleModel_0(
          this,
          Invocation.method(
            #getSchedule,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.ScheduleModel>);
}

/// A class which mocks [ScheduleLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockScheduleLocalDataSource extends _i1.Mock
    implements _i5.ScheduleLocalDataSource {
  @override
  _i4.Future<_i2.ScheduleModel> getSchedule(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getSchedule,
          [id],
        ),
        returnValue: _i4.Future<_i2.ScheduleModel>.value(_FakeScheduleModel_0(
          this,
          Invocation.method(
            #getSchedule,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.ScheduleModel>.value(_FakeScheduleModel_0(
          this,
          Invocation.method(
            #getSchedule,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.ScheduleModel>);
  @override
  _i4.Future<void> cacheSchedule(_i2.ScheduleModel? scheduleToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheSchedule,
          [scheduleToCache],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [UserModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserModel extends _i1.Mock implements _i7.UserModel {
  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  String get firstName => (super.noSuchMethod(
        Invocation.getter(#firstName),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get lastName => (super.noSuchMethod(
        Invocation.getter(#lastName),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [EventListModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventListModel extends _i1.Mock implements _i8.EventListModel {
  @override
  List<_i9.EventEntity> get events => (super.noSuchMethod(
        Invocation.getter(#events),
        returnValue: <_i9.EventEntity>[],
        returnValueForMissingStub: <_i9.EventEntity>[],
      ) as List<_i9.EventEntity>);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
