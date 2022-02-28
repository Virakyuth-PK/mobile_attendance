import 'dart:io';

import 'package:mobile_attendance/app/data/local/table/attendance_table.dart';
import 'package:mobile_attendance/app/data/local/table/user_table.dart';
import 'package:logger/logger.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';

part 'db_manager.g.dart';

openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Users, Attendances])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          // we added the dueDate property in the change from version 1
          await m.createTable(attendances);
        }
      }
  );

  // Add user
  Future insertUser(User user) async {
    Logger().i(user);
    return await into(users).insertOnConflictUpdate(user);
  }

  // Get user
  Future getUser() async {
    var result = await select(users).getSingleOrNull();
    return result;
  }

  // Delete user
  Future deleteUser(User user) async {
    Logger().i(user);
    return await delete(users).delete(user);
  }

  // Update user
  Future updateUser(User user) async {
    Logger().i(user);
    return await update(users).replace(user);
  }

  // delete table user
  Future deleteTableUser() async => await delete(users).go();

  // Add attendance
  Future insertAttendance(Attendance attendance) async {
    Logger().i(attendance);
    return await into(attendances).insertOnConflictUpdate(attendance);
  }

  // Get attendances
  Future getAttendance() async {
    var result = await select(attendances).get();
    return result;
  }

  // Delete attendance
  Future deleteAttendance(Attendance attendance) async {
    Logger().i(attendance);
    return await delete(attendances).delete(attendance);
  }

  // Update attendance
  Future updateAttendance(Attendance attendance) async {
    Logger().i(attendance);
    return await update(attendances).replace(attendance);
  }

  // delete table attendance
  Future deleteTableAttendance() async => await delete(attendances).go();
}
