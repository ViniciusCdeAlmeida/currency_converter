import 'package:currency_converter/models/serialized/currency.dart';
import 'package:currency_converter/models/serialized/rate.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rates.g.dart';

@JsonSerializable()
class Rates with ChangeNotifier {
  int id;
  String country;
  List<Rate> rate;
  Currency currency;

  Rates({
    this.id,
    this.country,
    this.rate,
    this.currency,
  });

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);

  Map<String, dynamic> toJson() => _$RatesToJson(this);
}
