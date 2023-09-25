import 'package:dartz/dartz.dart';
import 'package:flutter_calendar/core/error/exception.dart';
import 'package:flutter_calendar/core/error/failures.dart';
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_local_data_source.dart';
import 'package:flutter_calendar/features/get_events/data/datasources/schedule_remote_data_source.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/schedule_entity.dart';
import 'package:flutter_calendar/features/get_events/domain/repositories/schedule_repository.dart';
import 'package:flutter_calendar/core/platform/network_info.dart';

class ScheduleRepositoryImplementation implements ScheduleRepository {
  ScheduleLocalDataSource localDataSource;
  ScheduleRemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  ScheduleRepositoryImplementation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, ScheduleEntity>> getSchedule(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSchedule = await remoteDataSource.getSchedule(id);
        await localDataSource.cacheSchedule(remoteSchedule);
        return Right(remoteSchedule);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSchedule = await localDataSource.getSchedule(id);
        return Right(localSchedule);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
