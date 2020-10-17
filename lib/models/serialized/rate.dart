import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate.g.dart';

@JsonSerializable()
class Rate with ChangeNotifier {
  String key;
  double value;

  Rate({
    this.key,
    this.value,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  Map<String, dynamic> toJson() => _$RateToJson(this);
}
