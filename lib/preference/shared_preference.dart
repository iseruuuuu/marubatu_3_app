import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  stage1,
  stage2,
  stage3,
  stage4,
  stage5,
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<bool> getBool(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getBool(EnumToString.convertToString(key)) ?? false;
    return value;
  }

  Future<void> setBool(PreferenceKey key, bool value) async {
    final pref = await preference;
    await pref.setBool(EnumToString.convertToString(key), value);
  }
}
