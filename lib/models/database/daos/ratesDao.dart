import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/models/serialized/rates.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ratesDao.g.dart';

@UseDao(tables: [RatesDB])
class RatesDao extends DatabaseAccessor<AppDatabase> with _$RatesDaoMixin {
  final AppDatabase db;

  RatesDao(this.db) : super(db);

  // Future<List<LevantamentoDBData>> getAllLevantamentos(int idOrganizacao) =>
  //     (select(db.levantamentoDB)
  //           ..where((tbl) => tbl.idOrganizacao.equals(idOrganizacao)))
  //         .get();

  // Future<LevantamentoDBData> getVerificaLevantamentos() =>
  //     (select(db.levantamentoDB)..limit(1)).getSingle();

  Future<void> insertRates(Rates rates) async {
    into(ratesDB).insert(
      RatesDBCompanion(
        country: Value(rates.country),
        // rate: Value(rates.rate),
        currency: Value(rates.currency.id),
      ),
    );
  }
}
