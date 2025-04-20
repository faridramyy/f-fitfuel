import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'language_code';
  late SharedPreferences _prefs;
  String _languageCode = 'en';

  String get languageCode => _languageCode;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    final savedLanguage = _prefs.getString(_languageKey);
    if (savedLanguage != null) {
      _languageCode = savedLanguage;
      notifyListeners();
    }
  }

  Future<void> setLanguage(String languageCode) async {
    _languageCode = languageCode;
    await _prefs.setString(_languageKey, languageCode);
    notifyListeners();
  }
}
