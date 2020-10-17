import 'package:currency_converter/helpers/helper_user.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:currency_converter/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Authentication with ChangeNotifier {
  bool _userAuth = false;
  User _user;

  bool get isAuth {
    return _userAuth;
  }

  Future<void> _saveUser(User user) async {
    try {
      await db.userDao.insertUser(user);
    } catch (e) {}
  }

  Future<void> _getUser(User user) async {
    _userAuth = false;
    notifyListeners();

    try {
      _user = helperUser(await db.userDao.getUser(user));
    } catch (e) {}

    if (_user != null) {
      _userAuth = true;
      notifyListeners();
    }
  }

  Future<void> saveUser(
    String userName,
    String password,
  ) async {
    User user = new User();

    user.password = password;
    user.userName = userName;
    _saveUser(user);
  }

  Future<void> getUser(
    String userName,
    String password,
  ) async {
    User user = new User();

    user.password = password;
    user.userName = userName;
    _getUser(user);
  }

  Future<void> loguot() async {
    _user = null;
    _userAuth = false;
    notifyListeners();
  }
}
