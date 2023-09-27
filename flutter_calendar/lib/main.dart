import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/features/get_events/domain/entities/event_entity.dart';
import 'package:flutter_calendar/features/login/presentation/login.dart';

DateTime get _now => DateTime.now();

void main() {
  //runApp(const MyApp());
  runApp(const Login());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: MaterialApp(
          title: 'Flutter Calendar Page Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          scrollBehavior: const ScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.trackpad,
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          home: const Text("hello")),
    );
  }
}

List<CalendarEventData<EventEntity>> _events = [
  CalendarEventData(
    date: _now,
    event: EventEntity(1, "event", DateTime.now(),
        DateTime.now().add(const Duration(minutes: 30))),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now.add(const Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    event: EventEntity(1, "Wedding anniversary",
        DateTime.parse("2012-02-27 13:27:00,123456789z"), DateTime.now()),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    event: EventEntity(1, "Football anniversary",
        DateTime.parse("2017-02-27 13:27:00,123456789z"), DateTime.now()),
    title: "Football Tournament",
    description: "Go to football tournament.",
  ),
  CalendarEventData(
    date: _now.add(const Duration(days: 3)),
    startTime: DateTime(
        _now.add(const Duration(days: 3)).year,
        _now.add(const Duration(days: 3)).month,
        _now.add(const Duration(days: 3)).day,
        10),
    endTime: DateTime(
        _now.add(const Duration(days: 3)).year,
        _now.add(const Duration(days: 3)).month,
        _now.add(const Duration(days: 3)).day,
        14),
    event: EventEntity(1, "Sprint meeting",
        DateTime.parse("2023-02-27 13:27:00,123456789z"), DateTime.now()),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  CalendarEventData(
    date: _now.subtract(const Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        16),
    event: EventEntity(1, "Team meeting",
        DateTime.parse("2022-02-27 13:27:00,123456789z"), DateTime.now()),
    title: "Team Meeting",
    description: "Team Meeting",
  )
];
