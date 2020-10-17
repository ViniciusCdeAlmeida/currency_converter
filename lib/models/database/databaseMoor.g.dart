// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databaseMoor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserDBData extends DataClass implements Insertable<UserDBData> {
  final int id;
  final String userName;
  final String password;
  UserDBData(
      {@required this.id, @required this.userName, @required this.password});
  factory UserDBData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UserDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    return map;
  }

  UserDBCompanion toCompanion(bool nullToAbsent) {
    return UserDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  factory UserDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserDBData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
    };
  }

  UserDBData copyWith({int id, String userName, String password}) => UserDBData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('UserDBData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(userName.hashCode, password.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserDBData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.password == this.password);
}

class UserDBCompanion extends UpdateCompanion<UserDBData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> password;
  const UserDBCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
  });
  UserDBCompanion.insert({
    this.id = const Value.absent(),
    @required String userName,
    @required String password,
  })  : userName = Value(userName),
        password = Value(password);
  static Insertable<UserDBData> custom({
    Expression<int> id,
    Expression<String> userName,
    Expression<String> password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
    });
  }

  UserDBCompanion copyWith(
      {Value<int> id, Value<String> userName, Value<String> password}) {
    return UserDBCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDBCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $UserDBTable extends UserDB with TableInfo<$UserDBTable, UserDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, userName, password];
  @override
  $UserDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_d_b';
  @override
  final String actualTableName = 'user_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<UserDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password'], _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserDBTable createAlias(String alias) {
    return $UserDBTable(_db, alias);
  }
}

class HistoryDBData extends DataClass implements Insertable<HistoryDBData> {
  final int id;
  final String base;
  final DateTime savedDate;
  final String currencyDate;
  final List<Rate> rates;
  final int amount;
  final int userID;
  HistoryDBData(
      {@required this.id,
      @required this.base,
      @required this.savedDate,
      @required this.currencyDate,
      this.rates,
      @required this.amount,
      @required this.userID});
  factory HistoryDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return HistoryDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      base: stringType.mapFromDatabaseResponse(data['${effectivePrefix}base']),
      savedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}saved_date']),
      currencyDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency_date']),
      rates: $HistoryDBTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}rates'])),
      amount: intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      userID:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_i_d']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || base != null) {
      map['base'] = Variable<String>(base);
    }
    if (!nullToAbsent || savedDate != null) {
      map['saved_date'] = Variable<DateTime>(savedDate);
    }
    if (!nullToAbsent || currencyDate != null) {
      map['currency_date'] = Variable<String>(currencyDate);
    }
    if (!nullToAbsent || rates != null) {
      final converter = $HistoryDBTable.$converter0;
      map['rates'] = Variable<String>(converter.mapToSql(rates));
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<int>(amount);
    }
    if (!nullToAbsent || userID != null) {
      map['user_i_d'] = Variable<int>(userID);
    }
    return map;
  }

  HistoryDBCompanion toCompanion(bool nullToAbsent) {
    return HistoryDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      base: base == null && nullToAbsent ? const Value.absent() : Value(base),
      savedDate: savedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(savedDate),
      currencyDate: currencyDate == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyDate),
      rates:
          rates == null && nullToAbsent ? const Value.absent() : Value(rates),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      userID:
          userID == null && nullToAbsent ? const Value.absent() : Value(userID),
    );
  }

  factory HistoryDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return HistoryDBData(
      id: serializer.fromJson<int>(json['id']),
      base: serializer.fromJson<String>(json['base']),
      savedDate: serializer.fromJson<DateTime>(json['savedDate']),
      currencyDate: serializer.fromJson<String>(json['currencyDate']),
      rates: serializer.fromJson<List<Rate>>(json['rates']),
      amount: serializer.fromJson<int>(json['amount']),
      userID: serializer.fromJson<int>(json['userID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'base': serializer.toJson<String>(base),
      'savedDate': serializer.toJson<DateTime>(savedDate),
      'currencyDate': serializer.toJson<String>(currencyDate),
      'rates': serializer.toJson<List<Rate>>(rates),
      'amount': serializer.toJson<int>(amount),
      'userID': serializer.toJson<int>(userID),
    };
  }

  HistoryDBData copyWith(
          {int id,
          String base,
          DateTime savedDate,
          String currencyDate,
          List<Rate> rates,
          int amount,
          int userID}) =>
      HistoryDBData(
        id: id ?? this.id,
        base: base ?? this.base,
        savedDate: savedDate ?? this.savedDate,
        currencyDate: currencyDate ?? this.currencyDate,
        rates: rates ?? this.rates,
        amount: amount ?? this.amount,
        userID: userID ?? this.userID,
      );
  @override
  String toString() {
    return (StringBuffer('HistoryDBData(')
          ..write('id: $id, ')
          ..write('base: $base, ')
          ..write('savedDate: $savedDate, ')
          ..write('currencyDate: $currencyDate, ')
          ..write('rates: $rates, ')
          ..write('amount: $amount, ')
          ..write('userID: $userID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          base.hashCode,
          $mrjc(
              savedDate.hashCode,
              $mrjc(
                  currencyDate.hashCode,
                  $mrjc(rates.hashCode,
                      $mrjc(amount.hashCode, userID.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is HistoryDBData &&
          other.id == this.id &&
          other.base == this.base &&
          other.savedDate == this.savedDate &&
          other.currencyDate == this.currencyDate &&
          other.rates == this.rates &&
          other.amount == this.amount &&
          other.userID == this.userID);
}

class HistoryDBCompanion extends UpdateCompanion<HistoryDBData> {
  final Value<int> id;
  final Value<String> base;
  final Value<DateTime> savedDate;
  final Value<String> currencyDate;
  final Value<List<Rate>> rates;
  final Value<int> amount;
  final Value<int> userID;
  const HistoryDBCompanion({
    this.id = const Value.absent(),
    this.base = const Value.absent(),
    this.savedDate = const Value.absent(),
    this.currencyDate = const Value.absent(),
    this.rates = const Value.absent(),
    this.amount = const Value.absent(),
    this.userID = const Value.absent(),
  });
  HistoryDBCompanion.insert({
    this.id = const Value.absent(),
    @required String base,
    @required DateTime savedDate,
    @required String currencyDate,
    this.rates = const Value.absent(),
    @required int amount,
    @required int userID,
  })  : base = Value(base),
        savedDate = Value(savedDate),
        currencyDate = Value(currencyDate),
        amount = Value(amount),
        userID = Value(userID);
  static Insertable<HistoryDBData> custom({
    Expression<int> id,
    Expression<String> base,
    Expression<DateTime> savedDate,
    Expression<String> currencyDate,
    Expression<String> rates,
    Expression<int> amount,
    Expression<int> userID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (base != null) 'base': base,
      if (savedDate != null) 'saved_date': savedDate,
      if (currencyDate != null) 'currency_date': currencyDate,
      if (rates != null) 'rates': rates,
      if (amount != null) 'amount': amount,
      if (userID != null) 'user_i_d': userID,
    });
  }

  HistoryDBCompanion copyWith(
      {Value<int> id,
      Value<String> base,
      Value<DateTime> savedDate,
      Value<String> currencyDate,
      Value<List<Rate>> rates,
      Value<int> amount,
      Value<int> userID}) {
    return HistoryDBCompanion(
      id: id ?? this.id,
      base: base ?? this.base,
      savedDate: savedDate ?? this.savedDate,
      currencyDate: currencyDate ?? this.currencyDate,
      rates: rates ?? this.rates,
      amount: amount ?? this.amount,
      userID: userID ?? this.userID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (base.present) {
      map['base'] = Variable<String>(base.value);
    }
    if (savedDate.present) {
      map['saved_date'] = Variable<DateTime>(savedDate.value);
    }
    if (currencyDate.present) {
      map['currency_date'] = Variable<String>(currencyDate.value);
    }
    if (rates.present) {
      final converter = $HistoryDBTable.$converter0;
      map['rates'] = Variable<String>(converter.mapToSql(rates.value));
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryDBCompanion(')
          ..write('id: $id, ')
          ..write('base: $base, ')
          ..write('savedDate: $savedDate, ')
          ..write('currencyDate: $currencyDate, ')
          ..write('rates: $rates, ')
          ..write('amount: $amount, ')
          ..write('userID: $userID')
          ..write(')'))
        .toString();
  }
}

class $HistoryDBTable extends HistoryDB
    with TableInfo<$HistoryDBTable, HistoryDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $HistoryDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _baseMeta = const VerificationMeta('base');
  GeneratedTextColumn _base;
  @override
  GeneratedTextColumn get base => _base ??= _constructBase();
  GeneratedTextColumn _constructBase() {
    return GeneratedTextColumn(
      'base',
      $tableName,
      false,
    );
  }

  final VerificationMeta _savedDateMeta = const VerificationMeta('savedDate');
  GeneratedDateTimeColumn _savedDate;
  @override
  GeneratedDateTimeColumn get savedDate => _savedDate ??= _constructSavedDate();
  GeneratedDateTimeColumn _constructSavedDate() {
    return GeneratedDateTimeColumn(
      'saved_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currencyDateMeta =
      const VerificationMeta('currencyDate');
  GeneratedTextColumn _currencyDate;
  @override
  GeneratedTextColumn get currencyDate =>
      _currencyDate ??= _constructCurrencyDate();
  GeneratedTextColumn _constructCurrencyDate() {
    return GeneratedTextColumn(
      'currency_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratesMeta = const VerificationMeta('rates');
  GeneratedTextColumn _rates;
  @override
  GeneratedTextColumn get rates => _rates ??= _constructRates();
  GeneratedTextColumn _constructRates() {
    return GeneratedTextColumn(
      'rates',
      $tableName,
      true,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedIntColumn _amount;
  @override
  GeneratedIntColumn get amount => _amount ??= _constructAmount();
  GeneratedIntColumn _constructAmount() {
    return GeneratedIntColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIDMeta = const VerificationMeta('userID');
  GeneratedIntColumn _userID;
  @override
  GeneratedIntColumn get userID => _userID ??= _constructUserID();
  GeneratedIntColumn _constructUserID() {
    return GeneratedIntColumn(
      'user_i_d',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, base, savedDate, currencyDate, rates, amount, userID];
  @override
  $HistoryDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'history_d_b';
  @override
  final String actualTableName = 'history_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('base')) {
      context.handle(
          _baseMeta, base.isAcceptableOrUnknown(data['base'], _baseMeta));
    } else if (isInserting) {
      context.missing(_baseMeta);
    }
    if (data.containsKey('saved_date')) {
      context.handle(_savedDateMeta,
          savedDate.isAcceptableOrUnknown(data['saved_date'], _savedDateMeta));
    } else if (isInserting) {
      context.missing(_savedDateMeta);
    }
    if (data.containsKey('currency_date')) {
      context.handle(
          _currencyDateMeta,
          currencyDate.isAcceptableOrUnknown(
              data['currency_date'], _currencyDateMeta));
    } else if (isInserting) {
      context.missing(_currencyDateMeta);
    }
    context.handle(_ratesMeta, const VerificationResult.success());
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d'], _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return HistoryDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $HistoryDBTable createAlias(String alias) {
    return $HistoryDBTable(_db, alias);
  }

  static TypeConverter<List<Rate>, String> $converter0 = const RateConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserDBTable _userDB;
  $UserDBTable get userDB => _userDB ??= $UserDBTable(this);
  $HistoryDBTable _historyDB;
  $HistoryDBTable get historyDB => _historyDB ??= $HistoryDBTable(this);
  HistoryDao _historyDao;
  HistoryDao get historyDao => _historyDao ??= HistoryDao(this as AppDatabase);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDB, historyDB];
}
