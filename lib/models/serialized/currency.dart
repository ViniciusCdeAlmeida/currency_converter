import 'package:currency_converter/models/serialized/rate.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency with ChangeNotifier {
  int id;
  String base;
  String date;
  User user;
  List<Rate> rates;

  Currency({
    this.id,
    this.base,
    this.date,
    this.user,
    this.rates,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
