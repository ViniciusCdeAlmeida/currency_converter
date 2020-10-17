// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    id: json['id'] as int,
    base: json['base'] as String,
    date: json['date'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    rates: (json['rates'] as List)
        ?.map(
            (e) => e == null ? null : Rate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'base': instance.base,
      'date': instance.date,
      'user': instance.user,
      'rates': instance.rates,
    };
