import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/models/serialized/history.dart';

List<History> helperUserHistory(List<HistoryDBData> history) {
  return List<History>.from(
    (history).map(
      (item) => History(
          id: item.id,
          amount: item.amount,
          base: item.base,
          currencyDate: item.currencyDate,
          rates: item.rates,
          savedDate: item.savedDate,
          userID: item.userID),
    ),
  );
}
