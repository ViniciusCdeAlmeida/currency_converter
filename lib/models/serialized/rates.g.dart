// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rates _$RatesFromJson(Map<String, dynamic> json) {
  return Rates(
    id: json['id'] as int,
    country: json['country'] as String,
    rate: (json['rate'] as List)
        ?.map(
            (e) => e == null ? null : Rate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currency: json['currency'] == null
        ? null
        : Currency.fromJson(json['currency'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'rate': instance.rate,
      'currency': instance.currency,
    };
