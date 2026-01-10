// Package imports:
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
  final Future<SharedPreferences> preference = SharedPreferences.getInstance();

  Future<bool> getBool(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getBool(EnumToString.convertToString(key)) ?? false;
    return value;
  }

  Future<void> setBool({
    required PreferenceKey key,
    required bool value,
  }) async {
    final pref = await preference;
    await pref.setBool(EnumToString.convertToString(key), value);
  }
}
