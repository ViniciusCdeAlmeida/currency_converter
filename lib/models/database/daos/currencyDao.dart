import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/models/serialized/currency.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'currencyDao.g.dart';

@UseDao(tables: [CurrencyDB])
class CurrencyDao extends DatabaseAccessor<AppDatabase>
    with _$CurrencyDaoMixin {
  final AppDatabase db;

  CurrencyDao(this.db) : super(db);

  // Future<List<LevantamentoDBData>> getAllLevantamentos(int idOrganizacao) =>
  //     (select(db.levantamentoDB)
  //           ..where((tbl) => tbl.idOrganizacao.equals(idOrganizacao)))
  //         .get();

  // Future<LevantamentoDBData> getVerificaLevantamentos() =>
  //     (select(db.levantamentoDB)..limit(1)).getSingle();

  Future<void> insertCurrency(Currency currency) async {
    into(currencyDB).insert(
      CurrencyDBCompanion(
        base: Value(currency.base),
        // date: Value(currency.date),
        user: Value(currency.user.id),
      ),
    );
  }
}
