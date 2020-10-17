import 'package:currency_converter/models/database/daos/currencyDao.dart';
import 'package:currency_converter/models/database/daos/ratesDao.dart';
import 'package:currency_converter/models/database/daos/userDao.dart';

import 'package:moor_flutter/moor_flutter.dart';

part 'databaseMoor.g.dart';

class UserDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
}

class RatesDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get country => text()();
  RealColumn get rate => real()();
  IntColumn get currency => integer()();
}

class CurrencyDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get base => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get user => integer()();
}

@UseMoor(
  tables: [
    UserDB,
    RatesDB,
    CurrencyDB,
  ],
  daos: [
    CurrencyDao,
    UserDao,
    RatesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            // Good for debugging - prints SQL in the console
            // logStatements: true,
          )),
        );

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (m, from, to) {},
      );

  void deleteTable(TableInfo table) => delete(table).go();
}
