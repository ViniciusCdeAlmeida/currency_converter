import 'package:currency_converter/models/converter/rateConverter.dart';

import 'package:currency_converter/models/database/daos/historyDao.dart';
import 'package:currency_converter/models/database/daos/userDao.dart';

import 'package:currency_converter/models/serialized/rate.dart';

import 'package:moor_flutter/moor_flutter.dart';

part 'databaseMoor.g.dart';

class UserDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
}

class HistoryDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get base => text()();
  DateTimeColumn get savedDate => dateTime()();
  TextColumn get currencyDate => text()();
  TextColumn get rates => text().map(const RateConverter()).nullable()();
  IntColumn get amount => integer()();
  IntColumn get userID => integer()();
}

@UseMoor(
  tables: [
    UserDB,
    HistoryDB,
  ],
  daos: [
    HistoryDao,
    UserDao,
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

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (m, from, to) {
          // return m.createTable(historyDB);
          return m.addColumn(historyDB, historyDB.userID);
        },
      );

  void deleteTable(TableInfo table) => delete(table).go();
}
