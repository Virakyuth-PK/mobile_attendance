import 'package:moor/moor.dart';

class Users extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  BoolColumn get result => boolean()();

  TextColumn get token => text()();

  TextColumn get message => text()();

  TextColumn get code => text()();

  TextColumn get staffId => text()();

  TextColumn get name => text()();

  TextColumn get role => text()();

  TextColumn get department => text()();
}
