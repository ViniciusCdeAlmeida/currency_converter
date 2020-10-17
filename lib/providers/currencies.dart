import 'package:currency_converter/helpers/helper_currency.dart';
import 'package:currency_converter/models/serialized/currency.dart';
import 'package:currency_converter/models/serialized/rate.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class Currencies with ChangeNotifier {
  Currency _currency;
  String _amount;

  Currency get getCurrencies {
    return _currency;
  }

  String get getAmount {
    return _amount;
  }

  void setAmount(String amount) {
    _amount = amount;
  }

  Future<void> _getCurrency(String currency) async {
    Dio dio = new Dio();
    try {
      Response response = await dio
          .get("https://api.exchangeratesapi.io/latest?base=$currency")
          .timeout(
            Duration(seconds: 50),
          )
          .catchError(
        (error) {
          throw error;
        },
      );
      _currency = helperCurrency(response.data);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getCurrency(String currency) async {
    await _getCurrency(currency);
  }
}
