import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/models/serialized/history.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'historyDao.g.dart';

@UseDao(tables: [HistoryDB])
class HistoryDao extends DatabaseAccessor<AppDatabase> with _$HistoryDaoMixin {
  final AppDatabase db;

  HistoryDao(this.db) : super(db);

  Future<List<HistoryDBData>> getUserHisory(int userId) =>
      (select(db.historyDB)..where((tbl) => tbl.userID.equals(userId))).get();

  // Future<LevantamentoDBData> getVerificaLevantamentos() =>
  //     (select(db.levantamentoDB)..limit(1)).getSingle();

  Future<void> insertHistory(History history) async {
    into(historyDB).insert(
      HistoryDBCompanion(
        amount: Value(history.amount),
        base: Value(history.base),
        currencyDate: Value(history.currencyDate),
        rates: Value(history.rates),
        savedDate: Value(history.savedDate),
        userID: Value(history.userID),
      ),
    );
  }
}
