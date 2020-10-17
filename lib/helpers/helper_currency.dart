import 'package:currency_converter/models/serialized/currency.dart';
import 'package:currency_converter/models/serialized/rate.dart';

Currency helperCurrency(dynamic currency) {
  return Currency(
    id: currency['id'],
    base: currency['base'],
    date: currency['date'],
    rates: (currency['rates'] as Map)
        .entries
        .map(
          (e) => Rate(
            currency: e.key,
            value: e.value,
          ),
        )
        .toList(),
  );
}
