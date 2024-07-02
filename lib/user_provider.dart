import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _email;
  bool _isLoggedIn = false;

  String? get email => _email;
  bool get isLoggedIn => _isLoggedIn;

  void login(String email) {
    _email = email;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _email = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
