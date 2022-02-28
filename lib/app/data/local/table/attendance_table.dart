import 'package:moor/moor.dart';

class Attendances extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get staffId => text()();

  DateTimeColumn get dateTimeAttendance => dateTime()();

  RealColumn get latitude => real()();

  RealColumn get longitude => real()();

  TextColumn get address => text()();

  TextColumn get imei => text()();

  TextColumn get eventID => text()();

  TextColumn get imagePath => text()();

  TextColumn get comCode => text()();

  TextColumn get reason => text()();
}