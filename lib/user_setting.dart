import 'package:flutter_cal/global_type/theme_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late UserSetting userSetting;

class UserSetting {
  static UserSetting? _instance;
  static SharedPreferences? _preferences;

  static Future<UserSetting> newInstance() async {
    _preferences = await SharedPreferences.getInstance();
    _instance = UserSetting();

    return _instance!;
  }

  late UserSettingProperty<bool> testOnOff = UserSettingProperty('testOnOff', false);
  late UserSettingProperty<ThemeType> themeType = UserSettingProperty('themeType', ThemeType.system,
      customGetter: (str) => ThemeType.values.byName(str), customSetter: (themeType) => themeType.name);

  static dynamic _getFromDisk(String key) {
    var value = _preferences?.get(key);
    return value;
  }

  static void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences?.setBool(key, content);
    }
    if (content is int) {
      _preferences?.setInt(key, content);
    }
    if (content is double) {
      _preferences?.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }
}

class UserSettingProperty<T> {
  late StateProvider<T> propertyProvider;

  final String key;
  T defaultValue;
  T Function(String)? customGetter;
  String Function(T)? customSetter;

  UserSettingProperty(this.key, this.defaultValue, {this.customGetter, this.customSetter}) {
    propertyProvider = StateProvider<T>((ref) => get());
  }

  bool isWritten() {
    return UserSetting._getFromDisk(key) != null;
  }

  bool isNotWritten() {
    return !isWritten();
  }

  T get() {
    var prefValue = UserSetting._getFromDisk(key);
    if (prefValue == null) {
      return defaultValue;
    } else {
      if (customGetter == null) {
        return prefValue;
      } else {
        return customGetter!(prefValue);
      }
    }
  }

  T watch(WidgetRef ref) {
    return ref.watch(propertyProvider);
  }

  void setAndNotify(T value, WidgetRef ref) {
    if (customSetter == null) {
      UserSetting._saveToDisk(key, value);
    } else {
      UserSetting._saveToDisk(key, customSetter!(value));
    }
    ref.read(propertyProvider.notifier).state = value;
  }
}
