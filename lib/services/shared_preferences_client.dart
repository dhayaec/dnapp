import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesClient = Provider((ref) => SharedPreferencesClient());

class SharedPreferencesClient {
  Future<List<Map<String, dynamic>>> getJsonList({@required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return List<Map<String, dynamic>>.from(
      jsonDecode(prefs.getString(key) ?? '[]') as List,
    );
  }

  Future<Map<String, dynamic>> getJsonMap({@required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Map<String, dynamic>.from(
      jsonDecode(prefs.getString(key) ?? '{}') as Map,
    );
  }

  Future<void> saveJsonMap({
    @required String key,
    @required Map<String, dynamic> json,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(json));
  }

  Future<void> saveJsonList({
    @required String key,
    @required List<Map<String, dynamic>> json,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(json));
  }

  Future<String> getString({@required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> delete({@required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<void> saveString({
    @required String key,
    @required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
