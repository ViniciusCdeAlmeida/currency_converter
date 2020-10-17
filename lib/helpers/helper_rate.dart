import 'package:currency_converter/models/serialized/rate.dart';

Rate helperRate(Map rate) {
  return Rate(
    key: rate['key'],
    value: rate['value'],
  );
}
