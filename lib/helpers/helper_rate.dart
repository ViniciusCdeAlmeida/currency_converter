import 'package:currency_converter/models/serialized/rate.dart';

Rate helperRate(Map rate) {
  return Rate(
    currency: rate['currency'],
    value: rate['value'],
  );
}
