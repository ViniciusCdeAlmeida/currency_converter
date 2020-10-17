import 'package:currency_converter/helpers/helper_user.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:currency_converter/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Authentication with ChangeNotifier {
  bool _userAuth = false;
  User _user;
  bool _failed = false;

  bool get isAuth {
    return _userAuth;
  }

  User get actualUser {
    return _user;
  }

  bool get loginFail {
    return _failed;
  }

  _setFailed() {
    _failed = true;
    notifyListeners();
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
      _failed = false;
    } on NoSuchMethodError {
      _setFailed();
    }

    if (_user != null) {
      _failed = false;
      _userAuth = true;
      notifyListeners();
    }
  }

  void clean() {
    _user = null;
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
    clean();
    _userAuth = false;
    notifyListeners();
  }
}
