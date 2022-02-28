// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_manager.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int? id;
  final bool result;
  final String token;
  final String message;
  final String code;
  final String staffId;
  final String name;
  final String role;
  final String department;
  User(
      {this.id,
      required this.result,
      required this.token,
      required this.message,
      required this.code,
      required this.staffId,
      required this.name,
      required this.role,
      required this.department});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      result: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}result'])!,
      token: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}token'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      staffId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}staff_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      role: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}role'])!,
      department: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}department'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['result'] = Variable<bool>(result);
    map['token'] = Variable<String>(token);
    map['message'] = Variable<String>(message);
    map['code'] = Variable<String>(code);
    map['staff_id'] = Variable<String>(staffId);
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    map['department'] = Variable<String>(department);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      result: Value(result),
      token: Value(token),
      message: Value(message),
      code: Value(code),
      staffId: Value(staffId),
      name: Value(name),
      role: Value(role),
      department: Value(department),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int?>(json['id']),
      result: serializer.fromJson<bool>(json['result']),
      token: serializer.fromJson<String>(json['token']),
      message: serializer.fromJson<String>(json['message']),
      code: serializer.fromJson<String>(json['code']),
      staffId: serializer.fromJson<String>(json['staffId']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      department: serializer.fromJson<String>(json['department']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'result': serializer.toJson<bool>(result),
      'token': serializer.toJson<String>(token),
      'message': serializer.toJson<String>(message),
      'code': serializer.toJson<String>(code),
      'staffId': serializer.toJson<String>(staffId),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'department': serializer.toJson<String>(department),
    };
  }

  User copyWith(
          {int? id,
          bool? result,
          String? token,
          String? message,
          String? code,
          String? staffId,
          String? name,
          String? role,
          String? department}) =>
      User(
        id: id ?? this.id,
        result: result ?? this.result,
        token: token ?? this.token,
        message: message ?? this.message,
        code: code ?? this.code,
        staffId: staffId ?? this.staffId,
        name: name ?? this.name,
        role: role ?? this.role,
        department: department ?? this.department,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('result: $result, ')
          ..write('token: $token, ')
          ..write('message: $message, ')
          ..write('code: $code, ')
          ..write('staffId: $staffId, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, result, token, message, code, staffId, name, role, department);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.result == this.result &&
          other.token == this.token &&
          other.message == this.message &&
          other.code == this.code &&
          other.staffId == this.staffId &&
          other.name == this.name &&
          other.role == this.role &&
          other.department == this.department);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int?> id;
  final Value<bool> result;
  final Value<String> token;
  final Value<String> message;
  final Value<String> code;
  final Value<String> staffId;
  final Value<String> name;
  final Value<String> role;
  final Value<String> department;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.result = const Value.absent(),
    this.token = const Value.absent(),
    this.message = const Value.absent(),
    this.code = const Value.absent(),
    this.staffId = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.department = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required bool result,
    required String token,
    required String message,
    required String code,
    required String staffId,
    required String name,
    required String role,
    required String department,
  })  : result = Value(result),
        token = Value(token),
        message = Value(message),
        code = Value(code),
        staffId = Value(staffId),
        name = Value(name),
        role = Value(role),
        department = Value(department);
  static Insertable<User> custom({
    Expression<int?>? id,
    Expression<bool>? result,
    Expression<String>? token,
    Expression<String>? message,
    Expression<String>? code,
    Expression<String>? staffId,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? department,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (result != null) 'result': result,
      if (token != null) 'token': token,
      if (message != null) 'message': message,
      if (code != null) 'code': code,
      if (staffId != null) 'staff_id': staffId,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (department != null) 'department': department,
    });
  }

  UsersCompanion copyWith(
      {Value<int?>? id,
      Value<bool>? result,
      Value<String>? token,
      Value<String>? message,
      Value<String>? code,
      Value<String>? staffId,
      Value<String>? name,
      Value<String>? role,
      Value<String>? department}) {
    return UsersCompanion(
      id: id ?? this.id,
      result: result ?? this.result,
      token: token ?? this.token,
      message: message ?? this.message,
      code: code ?? this.code,
      staffId: staffId ?? this.staffId,
      name: name ?? this.name,
      role: role ?? this.role,
      department: department ?? this.department,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (result.present) {
      map['result'] = Variable<bool>(result.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('result: $result, ')
          ..write('token: $token, ')
          ..write('message: $message, ')
          ..write('code: $code, ')
          ..write('staffId: $staffId, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<bool?> result = GeneratedColumn<bool?>(
      'result', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (result IN (0, 1))');
  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String?> token = GeneratedColumn<String?>(
      'token', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _staffIdMeta = const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String?> staffId = GeneratedColumn<String?>(
      'staff_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String?> role = GeneratedColumn<String?>(
      'role', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _departmentMeta = const VerificationMeta('department');
  @override
  late final GeneratedColumn<String?> department = GeneratedColumn<String?>(
      'department', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, result, token, message, code, staffId, name, role, department];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    } else if (isInserting) {
      context.missing(_departmentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Attendance extends DataClass implements Insertable<Attendance> {
  final int? id;
  final String staffId;
  final DateTime dateTimeAttendance;
  final double latitude;
  final double longitude;
  final String address;
  final String imei;
  final String eventID;
  final String imagePath;
  final String comCode;
  final String reason;
  Attendance(
      {this.id,
      required this.staffId,
      required this.dateTimeAttendance,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.imei,
      required this.eventID,
      required this.imagePath,
      required this.comCode,
      required this.reason});
  factory Attendance.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Attendance(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      staffId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}staff_id'])!,
      dateTimeAttendance: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_time_attendance'])!,
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude'])!,
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address'])!,
      imei: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}imei'])!,
      eventID: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_i_d'])!,
      imagePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_path'])!,
      comCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}com_code'])!,
      reason: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reason'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['staff_id'] = Variable<String>(staffId);
    map['date_time_attendance'] = Variable<DateTime>(dateTimeAttendance);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['address'] = Variable<String>(address);
    map['imei'] = Variable<String>(imei);
    map['event_i_d'] = Variable<String>(eventID);
    map['image_path'] = Variable<String>(imagePath);
    map['com_code'] = Variable<String>(comCode);
    map['reason'] = Variable<String>(reason);
    return map;
  }

  AttendancesCompanion toCompanion(bool nullToAbsent) {
    return AttendancesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      staffId: Value(staffId),
      dateTimeAttendance: Value(dateTimeAttendance),
      latitude: Value(latitude),
      longitude: Value(longitude),
      address: Value(address),
      imei: Value(imei),
      eventID: Value(eventID),
      imagePath: Value(imagePath),
      comCode: Value(comCode),
      reason: Value(reason),
    );
  }

  factory Attendance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Attendance(
      id: serializer.fromJson<int?>(json['id']),
      staffId: serializer.fromJson<String>(json['staffId']),
      dateTimeAttendance:
          serializer.fromJson<DateTime>(json['dateTimeAttendance']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      address: serializer.fromJson<String>(json['address']),
      imei: serializer.fromJson<String>(json['imei']),
      eventID: serializer.fromJson<String>(json['eventID']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      comCode: serializer.fromJson<String>(json['comCode']),
      reason: serializer.fromJson<String>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'staffId': serializer.toJson<String>(staffId),
      'dateTimeAttendance': serializer.toJson<DateTime>(dateTimeAttendance),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'address': serializer.toJson<String>(address),
      'imei': serializer.toJson<String>(imei),
      'eventID': serializer.toJson<String>(eventID),
      'imagePath': serializer.toJson<String>(imagePath),
      'comCode': serializer.toJson<String>(comCode),
      'reason': serializer.toJson<String>(reason),
    };
  }

  Attendance copyWith(
          {int? id,
          String? staffId,
          DateTime? dateTimeAttendance,
          double? latitude,
          double? longitude,
          String? address,
          String? imei,
          String? eventID,
          String? imagePath,
          String? comCode,
          String? reason}) =>
      Attendance(
        id: id ?? this.id,
        staffId: staffId ?? this.staffId,
        dateTimeAttendance: dateTimeAttendance ?? this.dateTimeAttendance,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        imei: imei ?? this.imei,
        eventID: eventID ?? this.eventID,
        imagePath: imagePath ?? this.imagePath,
        comCode: comCode ?? this.comCode,
        reason: reason ?? this.reason,
      );
  @override
  String toString() {
    return (StringBuffer('Attendance(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('dateTimeAttendance: $dateTimeAttendance, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('imei: $imei, ')
          ..write('eventID: $eventID, ')
          ..write('imagePath: $imagePath, ')
          ..write('comCode: $comCode, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, staffId, dateTimeAttendance, latitude,
      longitude, address, imei, eventID, imagePath, comCode, reason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attendance &&
          other.id == this.id &&
          other.staffId == this.staffId &&
          other.dateTimeAttendance == this.dateTimeAttendance &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.imei == this.imei &&
          other.eventID == this.eventID &&
          other.imagePath == this.imagePath &&
          other.comCode == this.comCode &&
          other.reason == this.reason);
}

class AttendancesCompanion extends UpdateCompanion<Attendance> {
  final Value<int?> id;
  final Value<String> staffId;
  final Value<DateTime> dateTimeAttendance;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> address;
  final Value<String> imei;
  final Value<String> eventID;
  final Value<String> imagePath;
  final Value<String> comCode;
  final Value<String> reason;
  const AttendancesCompanion({
    this.id = const Value.absent(),
    this.staffId = const Value.absent(),
    this.dateTimeAttendance = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.imei = const Value.absent(),
    this.eventID = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.comCode = const Value.absent(),
    this.reason = const Value.absent(),
  });
  AttendancesCompanion.insert({
    this.id = const Value.absent(),
    required String staffId,
    required DateTime dateTimeAttendance,
    required double latitude,
    required double longitude,
    required String address,
    required String imei,
    required String eventID,
    required String imagePath,
    required String comCode,
    required String reason,
  })  : staffId = Value(staffId),
        dateTimeAttendance = Value(dateTimeAttendance),
        latitude = Value(latitude),
        longitude = Value(longitude),
        address = Value(address),
        imei = Value(imei),
        eventID = Value(eventID),
        imagePath = Value(imagePath),
        comCode = Value(comCode),
        reason = Value(reason);
  static Insertable<Attendance> custom({
    Expression<int?>? id,
    Expression<String>? staffId,
    Expression<DateTime>? dateTimeAttendance,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? address,
    Expression<String>? imei,
    Expression<String>? eventID,
    Expression<String>? imagePath,
    Expression<String>? comCode,
    Expression<String>? reason,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (staffId != null) 'staff_id': staffId,
      if (dateTimeAttendance != null)
        'date_time_attendance': dateTimeAttendance,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (imei != null) 'imei': imei,
      if (eventID != null) 'event_i_d': eventID,
      if (imagePath != null) 'image_path': imagePath,
      if (comCode != null) 'com_code': comCode,
      if (reason != null) 'reason': reason,
    });
  }

  AttendancesCompanion copyWith(
      {Value<int?>? id,
      Value<String>? staffId,
      Value<DateTime>? dateTimeAttendance,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String>? address,
      Value<String>? imei,
      Value<String>? eventID,
      Value<String>? imagePath,
      Value<String>? comCode,
      Value<String>? reason}) {
    return AttendancesCompanion(
      id: id ?? this.id,
      staffId: staffId ?? this.staffId,
      dateTimeAttendance: dateTimeAttendance ?? this.dateTimeAttendance,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      imei: imei ?? this.imei,
      eventID: eventID ?? this.eventID,
      imagePath: imagePath ?? this.imagePath,
      comCode: comCode ?? this.comCode,
      reason: reason ?? this.reason,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (dateTimeAttendance.present) {
      map['date_time_attendance'] =
          Variable<DateTime>(dateTimeAttendance.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (imei.present) {
      map['imei'] = Variable<String>(imei.value);
    }
    if (eventID.present) {
      map['event_i_d'] = Variable<String>(eventID.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (comCode.present) {
      map['com_code'] = Variable<String>(comCode.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendancesCompanion(')
          ..write('id: $id, ')
          ..write('staffId: $staffId, ')
          ..write('dateTimeAttendance: $dateTimeAttendance, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('imei: $imei, ')
          ..write('eventID: $eventID, ')
          ..write('imagePath: $imagePath, ')
          ..write('comCode: $comCode, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }
}

class $AttendancesTable extends Attendances
    with TableInfo<$AttendancesTable, Attendance> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AttendancesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _staffIdMeta = const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String?> staffId = GeneratedColumn<String?>(
      'staff_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dateTimeAttendanceMeta =
      const VerificationMeta('dateTimeAttendance');
  @override
  late final GeneratedColumn<DateTime?> dateTimeAttendance =
      GeneratedColumn<DateTime?>('date_time_attendance', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imeiMeta = const VerificationMeta('imei');
  @override
  late final GeneratedColumn<String?> imei = GeneratedColumn<String?>(
      'imei', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _eventIDMeta = const VerificationMeta('eventID');
  @override
  late final GeneratedColumn<String?> eventID = GeneratedColumn<String?>(
      'event_i_d', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imagePathMeta = const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String?> imagePath = GeneratedColumn<String?>(
      'image_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _comCodeMeta = const VerificationMeta('comCode');
  @override
  late final GeneratedColumn<String?> comCode = GeneratedColumn<String?>(
      'com_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String?> reason = GeneratedColumn<String?>(
      'reason', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        staffId,
        dateTimeAttendance,
        latitude,
        longitude,
        address,
        imei,
        eventID,
        imagePath,
        comCode,
        reason
      ];
  @override
  String get aliasedName => _alias ?? 'attendances';
  @override
  String get actualTableName => 'attendances';
  @override
  VerificationContext validateIntegrity(Insertable<Attendance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('date_time_attendance')) {
      context.handle(
          _dateTimeAttendanceMeta,
          dateTimeAttendance.isAcceptableOrUnknown(
              data['date_time_attendance']!, _dateTimeAttendanceMeta));
    } else if (isInserting) {
      context.missing(_dateTimeAttendanceMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('imei')) {
      context.handle(
          _imeiMeta, imei.isAcceptableOrUnknown(data['imei']!, _imeiMeta));
    } else if (isInserting) {
      context.missing(_imeiMeta);
    }
    if (data.containsKey('event_i_d')) {
      context.handle(_eventIDMeta,
          eventID.isAcceptableOrUnknown(data['event_i_d']!, _eventIDMeta));
    } else if (isInserting) {
      context.missing(_eventIDMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('com_code')) {
      context.handle(_comCodeMeta,
          comCode.isAcceptableOrUnknown(data['com_code']!, _comCodeMeta));
    } else if (isInserting) {
      context.missing(_comCodeMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attendance map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Attendance.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AttendancesTable createAlias(String alias) {
    return $AttendancesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $AttendancesTable attendances = $AttendancesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, attendances];
}
