import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStorageHelper {
  static GetStorage? _storage;

  static Future<bool> init() async => await GetStorage.init('1').then(
        (value) async {
          log('init: $value');
          if (value) _storage = GetStorage('1');
          log('_storage: ${await _storage?.initStorage}');
          return value;
        },
      );

  static Map<String, dynamic>? readMap(String key) {
    return _storage?.read(key) as Map<String, dynamic>?;
  }

  static List<dynamic>? readList(String key) {
    return _storage?.read(key) as List<dynamic>?;
  }

  static String? readString(String key) {
    return _storage?.read(key) as String?;
  }

  static bool? readBool(String key) {
    return _storage?.read(key) as bool?;
  }

  static int? readInt(String key) {
    return _storage?.read(key) as int?;
  }

  static double? readDouble(String key) {
    return _storage?.read(key) as double?;
  }

  static Future<void>? write(String key, dynamic value) {
    return _storage?.write(key, value);
  }

  static Future<void> remove(String key) async {
    return await _storage?.remove(key);
  }
}

const userKey = "USER";

const profileKey = "PROFILE";

const accountsKey = "ACCOUNTS";

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Map<String, dynamic>? getMap(String key) {
    String? value = _preferences?.getString(key);
    if (value != null) {
      return json.decode(value);
    }
    return null;
  }

  static List<String>? getList(String key) {
    log('${_preferences?.getStringList(key)}');
    return _preferences?.getStringList(key);
  }

  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  static bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  static int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  static double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  static Future<bool>? save(String key, dynamic value) {
    if (value is String) {
      return _preferences?.setString(key, value);
    }
    if (value is bool) {
      return _preferences?.setBool(key, value);
    }
    if (value is int) {
      return _preferences?.setInt(key, value);
    }
    if (value is double) {
      return _preferences?.setDouble(key, value);
    }

    if (value is List || value is Map) {
      return _preferences?.setString(key, jsonEncode(value));
    }
    return null;
  }

  static Future<bool>? setList(String key, List<String> value) {
    return _preferences?.setStringList(key, value);
  }

  static Future<bool> remove(String key) async {
    return await _preferences?.remove(key) ?? false;
  }
}
