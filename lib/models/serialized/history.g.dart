// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
    id: json['id'] as int,
    base: json['base'] as String,
    currencyDate: json['currencyDate'] as String,
    rates: (json['rates'] as List)
        ?.map(
            (e) => e == null ? null : Rate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    savedDate: json['savedDate'] == null
        ? null
        : DateTime.parse(json['savedDate'] as String),
    userID: json['userID'] as int,
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'id': instance.id,
      'base': instance.base,
      'currencyDate': instance.currencyDate,
      'rates': instance.rates,
      'savedDate': instance.savedDate?.toIso8601String(),
      'userID': instance.userID,
      'amount': instance.amount,
    };
