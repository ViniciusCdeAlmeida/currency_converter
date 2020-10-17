import 'package:currency_converter/models/serialized/rate.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History with ChangeNotifier {
  int id;
  String base;
  String currencyDate;
  List<Rate> rates;
  DateTime savedDate;
  int userID;
  int amount;

  History({
    this.id,
    this.base,
    this.currencyDate,
    this.rates,
    this.savedDate,
    this.userID,
    this.amount,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
