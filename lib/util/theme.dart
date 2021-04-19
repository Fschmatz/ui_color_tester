import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
    ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFFEEEEEE),
    accentColor: Colors.tealAccent[700],
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    cardTheme: CardTheme(
      color: Color(0xFFEEEEEE),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
    ),

    bottomAppBarColor: Color(0xFFEEEEEE),
    bottomSheetTheme: BottomSheetThemeData(
        modalBackgroundColor: Color(0xFFEEEEEE))
    );

//ESCURO
    ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF202020),
    accentColor: Colors.tealAccent[700],
    scaffoldBackgroundColor: Color(0xFF202020),

    cardTheme: CardTheme(
      color: Color(0xFF252525),
    ),

    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFF202020),
    ),

    bottomAppBarColor: Color(0xFF181818),
    bottomSheetTheme:
      BottomSheetThemeData(modalBackgroundColor: Color(0xFF181818))
    );

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  SharedPreferences prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}
