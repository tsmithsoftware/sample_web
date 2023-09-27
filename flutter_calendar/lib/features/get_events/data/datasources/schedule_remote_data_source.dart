import 'dart:convert';

import 'package:flutter_calendar/core/error/exception.dart';
import 'package:flutter_calendar/features/get_events/data/models/schedule_model.dart';
import 'package:http/http.dart' as http;

abstract class ScheduleRemoteDataSource {
  Future<ScheduleModel> getSchedule(int id);
}

class ScheduleRemoteDataSourceImpl extends ScheduleRemoteDataSource {
  http.Client client;
  ScheduleRemoteDataSourceImpl({required this.client});

  @override
  Future<ScheduleModel> getSchedule(int id) async {
    final response = await client.get(
      Uri.parse('http://localhost:4002/schedules/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ScheduleModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
