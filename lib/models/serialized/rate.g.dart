// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rate _$RateFromJson(Map<String, dynamic> json) {
  return Rate(
    currency: json['currency'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'currency': instance.currency,
      'value': instance.value,
    };
