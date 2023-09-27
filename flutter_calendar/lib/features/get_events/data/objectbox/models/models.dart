import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;

  String firstName;
  String lastName;

  @Property(type: PropertyType.date)
  DateTime? date;

  final schedule = ToOne<Schedule>();

  User({required this.firstName, required this.lastName});
}

@Entity()
class Event {
  @Id()
  int id = 0;

  String? eventName;

  @Property(type: PropertyType.date)
  DateTime? startTime;

  @Property(type: PropertyType.date)
  DateTime? endTime;

  final schedule = ToOne<Schedule>();

  Event(
      {required this.eventName,
      required this.startTime,
      required this.endTime});
}

@Entity()
class Schedule {
  @Id()
  int id = 0;

  String? scheduleName;

  final user = ToOne<User>();

  @Backlink()
  final events = ToMany<Event>();

  Schedule({required this.scheduleName});
}
