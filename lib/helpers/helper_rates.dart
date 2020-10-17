import 'package:currency_converter/models/serialized/rates.dart';

Rates helperRates(Rates rates) {
  return Rates(
    id: rates.id,
    country: rates.country,
    // rate: rates.rate,
  );
}
