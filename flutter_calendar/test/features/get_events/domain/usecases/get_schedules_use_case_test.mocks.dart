// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_calendar/test/features/get_events/domain/usecases/get_schedules_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_calendar/core/error/failures.dart' as _i7;
import 'package:flutter_calendar/core/features/get_events/domain/entities/event_list_entity.dart'
    as _i4;
import 'package:flutter_calendar/core/features/get_events/domain/entities/schedule_entity.dart'
    as _i8;
import 'package:flutter_calendar/core/features/get_events/domain/entities/user_entity.dart'
    as _i3;
import 'package:flutter_calendar/core/features/get_events/domain/repositories/schedule_repository.dart'
    as _i5;
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserEntity_1 extends _i1.SmartFake implements _i3.UserEntity {
  _FakeUserEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEventListEntity_2 extends _i1.SmartFake
    implements _i4.EventListEntity {
  _FakeEventListEntity_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ScheduleRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockScheduleRepository extends _i1.Mock
    implements _i5.ScheduleRepository {
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.ScheduleEntity>> getSchedule(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSchedule,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i8.ScheduleEntity>>.value(
                _FakeEither_0<_i7.Failure, _i8.ScheduleEntity>(
          this,
          Invocation.method(
            #getSchedule,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, _i8.ScheduleEntity>>.value(
                _FakeEither_0<_i7.Failure, _i8.ScheduleEntity>(
          this,
          Invocation.method(
            #getSchedule,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.ScheduleEntity>>);
}

/// A class which mocks [ScheduleEntity].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockScheduleEntity extends _i1.Mock implements _i8.ScheduleEntity {
  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  String get scheduleName => (super.noSuchMethod(
        Invocation.getter(#scheduleName),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i3.UserEntity get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeUserEntity_1(
          this,
          Invocation.getter(#user),
        ),
        returnValueForMissingStub: _FakeUserEntity_1(
          this,
          Invocation.getter(#user),
        ),
      ) as _i3.UserEntity);
  @override
  _i4.EventListEntity get events => (super.noSuchMethod(
        Invocation.getter(#events),
        returnValue: _FakeEventListEntity_2(
          this,
          Invocation.getter(#events),
        ),
        returnValueForMissingStub: _FakeEventListEntity_2(
          this,
          Invocation.getter(#events),
        ),
      ) as _i4.EventListEntity);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);
}
