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

class RatesDBData extends DataClass implements Insertable<RatesDBData> {
  final int id;
  final String country;
  final double rate;
  final int currency;
  RatesDBData(
      {@required this.id,
      @required this.country,
      @required this.rate,
      @required this.currency});
  factory RatesDBData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return RatesDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      rate: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}rate']),
      currency:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}currency']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || rate != null) {
      map['rate'] = Variable<double>(rate);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<int>(currency);
    }
    return map;
  }

  RatesDBCompanion toCompanion(bool nullToAbsent) {
    return RatesDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      rate: rate == null && nullToAbsent ? const Value.absent() : Value(rate),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
    );
  }

  factory RatesDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RatesDBData(
      id: serializer.fromJson<int>(json['id']),
      country: serializer.fromJson<String>(json['country']),
      rate: serializer.fromJson<double>(json['rate']),
      currency: serializer.fromJson<int>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country': serializer.toJson<String>(country),
      'rate': serializer.toJson<double>(rate),
      'currency': serializer.toJson<int>(currency),
    };
  }

  RatesDBData copyWith({int id, String country, double rate, int currency}) =>
      RatesDBData(
        id: id ?? this.id,
        country: country ?? this.country,
        rate: rate ?? this.rate,
        currency: currency ?? this.currency,
      );
  @override
  String toString() {
    return (StringBuffer('RatesDBData(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('rate: $rate, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(country.hashCode, $mrjc(rate.hashCode, currency.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RatesDBData &&
          other.id == this.id &&
          other.country == this.country &&
          other.rate == this.rate &&
          other.currency == this.currency);
}

class RatesDBCompanion extends UpdateCompanion<RatesDBData> {
  final Value<int> id;
  final Value<String> country;
  final Value<double> rate;
  final Value<int> currency;
  const RatesDBCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
    this.rate = const Value.absent(),
    this.currency = const Value.absent(),
  });
  RatesDBCompanion.insert({
    this.id = const Value.absent(),
    @required String country,
    @required double rate,
    @required int currency,
  })  : country = Value(country),
        rate = Value(rate),
        currency = Value(currency);
  static Insertable<RatesDBData> custom({
    Expression<int> id,
    Expression<String> country,
    Expression<double> rate,
    Expression<int> currency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (country != null) 'country': country,
      if (rate != null) 'rate': rate,
      if (currency != null) 'currency': currency,
    });
  }

  RatesDBCompanion copyWith(
      {Value<int> id,
      Value<String> country,
      Value<double> rate,
      Value<int> currency}) {
    return RatesDBCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
      rate: rate ?? this.rate,
      currency: currency ?? this.currency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (currency.present) {
      map['currency'] = Variable<int>(currency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RatesDBCompanion(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('rate: $rate, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }
}

class $RatesDBTable extends RatesDB with TableInfo<$RatesDBTable, RatesDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $RatesDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rateMeta = const VerificationMeta('rate');
  GeneratedRealColumn _rate;
  @override
  GeneratedRealColumn get rate => _rate ??= _constructRate();
  GeneratedRealColumn _constructRate() {
    return GeneratedRealColumn(
      'rate',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedIntColumn _currency;
  @override
  GeneratedIntColumn get currency => _currency ??= _constructCurrency();
  GeneratedIntColumn _constructCurrency() {
    return GeneratedIntColumn(
      'currency',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, country, rate, currency];
  @override
  $RatesDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'rates_d_b';
  @override
  final String actualTableName = 'rates_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<RatesDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country'], _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate'], _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RatesDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RatesDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RatesDBTable createAlias(String alias) {
    return $RatesDBTable(_db, alias);
  }
}

class CurrencyDBData extends DataClass implements Insertable<CurrencyDBData> {
  final int id;
  final String base;
  final DateTime date;
  final int user;
  CurrencyDBData(
      {@required this.id,
      @required this.base,
      @required this.date,
      @required this.user});
  factory CurrencyDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return CurrencyDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      base: stringType.mapFromDatabaseResponse(data['${effectivePrefix}base']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      user: intType.mapFromDatabaseResponse(data['${effectivePrefix}user']),
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
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<int>(user);
    }
    return map;
  }

  CurrencyDBCompanion toCompanion(bool nullToAbsent) {
    return CurrencyDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      base: base == null && nullToAbsent ? const Value.absent() : Value(base),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
    );
  }

  factory CurrencyDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CurrencyDBData(
      id: serializer.fromJson<int>(json['id']),
      base: serializer.fromJson<String>(json['base']),
      date: serializer.fromJson<DateTime>(json['date']),
      user: serializer.fromJson<int>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'base': serializer.toJson<String>(base),
      'date': serializer.toJson<DateTime>(date),
      'user': serializer.toJson<int>(user),
    };
  }

  CurrencyDBData copyWith({int id, String base, DateTime date, int user}) =>
      CurrencyDBData(
        id: id ?? this.id,
        base: base ?? this.base,
        date: date ?? this.date,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyDBData(')
          ..write('id: $id, ')
          ..write('base: $base, ')
          ..write('date: $date, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(base.hashCode, $mrjc(date.hashCode, user.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CurrencyDBData &&
          other.id == this.id &&
          other.base == this.base &&
          other.date == this.date &&
          other.user == this.user);
}

class CurrencyDBCompanion extends UpdateCompanion<CurrencyDBData> {
  final Value<int> id;
  final Value<String> base;
  final Value<DateTime> date;
  final Value<int> user;
  const CurrencyDBCompanion({
    this.id = const Value.absent(),
    this.base = const Value.absent(),
    this.date = const Value.absent(),
    this.user = const Value.absent(),
  });
  CurrencyDBCompanion.insert({
    this.id = const Value.absent(),
    @required String base,
    @required DateTime date,
    @required int user,
  })  : base = Value(base),
        date = Value(date),
        user = Value(user);
  static Insertable<CurrencyDBData> custom({
    Expression<int> id,
    Expression<String> base,
    Expression<DateTime> date,
    Expression<int> user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (base != null) 'base': base,
      if (date != null) 'date': date,
      if (user != null) 'user': user,
    });
  }

  CurrencyDBCompanion copyWith(
      {Value<int> id,
      Value<String> base,
      Value<DateTime> date,
      Value<int> user}) {
    return CurrencyDBCompanion(
      id: id ?? this.id,
      base: base ?? this.base,
      date: date ?? this.date,
      user: user ?? this.user,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDBCompanion(')
          ..write('id: $id, ')
          ..write('base: $base, ')
          ..write('date: $date, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $CurrencyDBTable extends CurrencyDB
    with TableInfo<$CurrencyDBTable, CurrencyDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CurrencyDBTable(this._db, [this._alias]);
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

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  GeneratedIntColumn _user;
  @override
  GeneratedIntColumn get user => _user ??= _constructUser();
  GeneratedIntColumn _constructUser() {
    return GeneratedIntColumn(
      'user',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, base, date, user];
  @override
  $CurrencyDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'currency_d_b';
  @override
  final String actualTableName = 'currency_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<CurrencyDBData> instance,
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
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user'], _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CurrencyDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CurrencyDBTable createAlias(String alias) {
    return $CurrencyDBTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserDBTable _userDB;
  $UserDBTable get userDB => _userDB ??= $UserDBTable(this);
  $RatesDBTable _ratesDB;
  $RatesDBTable get ratesDB => _ratesDB ??= $RatesDBTable(this);
  $CurrencyDBTable _currencyDB;
  $CurrencyDBTable get currencyDB => _currencyDB ??= $CurrencyDBTable(this);
  CurrencyDao _currencyDao;
  CurrencyDao get currencyDao =>
      _currencyDao ??= CurrencyDao(this as AppDatabase);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDatabase);
  RatesDao _ratesDao;
  RatesDao get ratesDao => _ratesDao ??= RatesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userDB, ratesDB, currencyDB];
}
