import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;
  static Future<void> init() async{
    prefs= await SharedPreferences.getInstance();
  }

  static Future<bool>setData({required String key, required dynamic value}){
    if(value is String){
      return prefs.setString(key, value);
    }else if(value is int){
      return prefs.setInt(key, value);
    }else if(value is double){
      return prefs.setDouble(key, value);
    }else if(value is List<String>){
      return prefs.setStringList(key, value);
    }else if(value is bool){
      return prefs.setBool(key, value);
    }
    return prefs.setString(key, jsonEncode(value));
  }

  static Object? getDate({required String key}){
    return prefs.get(key);
  }
  static Future<bool> removeData(String key) async {
    return await prefs.remove(key);
  }

  static Future<bool> clearAll() async {
    return await prefs.clear();
  }

}