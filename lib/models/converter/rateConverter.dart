import 'dart:convert';
import 'package:currency_converter/models/serialized/rate.dart';
import 'package:moor_flutter/moor_flutter.dart';

class RateConverter extends TypeConverter<List<Rate>, String> {
  const RateConverter();

  @override
  List<Rate> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var rateJson = json.decode(fromDb);

    return (rateJson as List).map((i) => Rate.fromJson(i)).toList();
  }

  @override
  String mapToSql(List<Rate> rate) {
    if (rate.isEmpty) {
      return null;
    }
    return json.encode(rate.map((details) => details.toJson()).toList());
  }
}
