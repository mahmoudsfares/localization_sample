import 'dart:ui';
import 'package:localization_sample/strings/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependencies {

  // TODO 6: keep an instance of SharedPreferences and set it once on app launch
  static late final SharedPreferences _preferences;

  static Future<void> setPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _setLocale();
  }

  // TODO 7: keep an instance of the current locale
  static late Locale _locale;
  static Locale get locale => _locale;

  static void _setLocale(){
    _locale = Locale(_preferences.getString(AppStrings.locale) ?? AppStrings.englishCode);
  }

  // TODO 8: change the current language then use current language code to update the locale object
  static Future<void> changeLang() async {
    if (_locale.languageCode == AppStrings.englishCode) {
      await _preferences.setString(AppStrings.locale, AppStrings.arabicCode);
    } else {
      await _preferences.setString(AppStrings.locale, AppStrings.englishCode);
    }
    _setLocale();
  }
}
