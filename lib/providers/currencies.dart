import 'package:currency_converter/helpers/helper_currency.dart';
import 'package:currency_converter/helpers/helper_history.dart';
import 'package:currency_converter/main.dart';
import 'package:currency_converter/models/serialized/currency.dart';
import 'package:currency_converter/models/serialized/history.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class Currencies with ChangeNotifier {
  Currency _currency;
  String _amount;
  List<History> _history = [];

  bool _isLoading = false;

  Currency get getCurrencies {
    return _currency;
  }

  bool get loading {
    return _isLoading;
  }

  List<History> get userHistory {
    return _history;
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

  Future<void> _getUserHistory(int userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _history = helperUserHistory(await db.historyDao.getUserHisory(userId));
      _isLoading = false;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> _saveCurrency(User user) async {
    History hist = new History(
      amount: int.parse(_amount == null || _amount == "" ? "1" : _amount),
      base: _currency.base,
      currencyDate: _currency.date,
      savedDate: DateTime.now(),
      rates: _currency.rates,
      userID: user.id,
    );
    try {
      await db.historyDao.insertHistory(hist);
    } catch (e) {}
  }

  void clean() {
    _amount = null;
    _currency = null;
    _history = [];
  }

  Future<void> getCurrency(String currency) async {
    await _getCurrency(currency);
  }

  Future<void> getUserHistory(int userId) async {
    await _getUserHistory(userId);
  }

  Future<void> saveCurrency(User user) async {
    await _saveCurrency(user);
  }
}
