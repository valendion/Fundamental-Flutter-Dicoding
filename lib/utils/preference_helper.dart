import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper(this.sharedPreferences);

  static const darkTheme = 'DARK_THEME';
  static const dailyNewsRestorant = 'DAILY_NEWS_RESTOURANT';

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  Future<bool> get isDailyNewsRestourantActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNewsRestorant) ?? false;
  }

  setDailyNewsRestourantActive(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNewsRestorant, value);
  }
}
