import 'dart:convert';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a String value from SharedPreferences with given [key].
  static getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  /// Saves the user's email in SharedPreferences
  static saveEmail(String email) async {
    debugPrint('SharedPrefHelper : Saving email : $email');
    await setData('email', email);
  }

  /// Retrieves the saved email from SharedPreferences
  static Future<String> getEmail() async {
    debugPrint('SharedPrefHelper : Retrieving email');
    return await getString('email');
  }

  /// Saves the OTP securely in FlutterSecureStorage
  static saveOtp(String otp) async {
    debugPrint('SharedPrefHelper : Saving OTP');
    await setSecuredString('otp', otp);
  }

  /// Retrieves the saved OTP from FlutterSecureStorage
  static Future<String> getOtp() async {
    debugPrint('SharedPrefHelper : Retrieving OTP');
    return await getSecuredString('otp');
  }

  /// Removes email from SharedPreferences
  static removeEmail() async {
    debugPrint('SharedPrefHelper : Removing email');
    await removeData('email');
  }

  /// Check if the app is launched for the first time
  static Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.isFirstLaunch) ?? true;
  }

  static Future<void> setFirstLaunch(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', value);
  }

  static Future<bool?> getSecuredBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<bool> isSurveyCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.isSurveyCompleted) ?? false;
  }

  static Future<void> setSurveyCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefKeys.isSurveyCompleted, value);
  }

  /// Fetch the saved survey result as a String
  static Future<String?> getSurveyResult() async {
    debugPrint('SharedPrefHelper : Retrieving survey result');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('surveyResult');
  }

  // Optionally, create a method to save the survey result
  static Future<void> saveSurveyResult(String value) async {
    debugPrint('SharedPrefHelper : Saving survey result');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('surveyResult', value);
  }

  // Fetch the anxiety level id from the saved survey result
  static Future<int?> getAnxietyLevelId() async {
    String? surveyResult = await getSurveyResult();
    if (surveyResult != null) {
      Map<String, dynamic> resultMap = json.decode(surveyResult);
      return resultMap['anxiety_level_id'];
    }
    return null;
  }

  /// Saves the post ID in SharedPreferences
  static Future<void> savePostId(String postId) async {
    debugPrint('SharedPrefHelper : Saving post ID : $postId');
    await setData('post_id', postId);
  }

  /// Retrieves the saved post ID from SharedPreferences
  static Future<String?> getPostId() async {
    debugPrint('SharedPrefHelper : Retrieving post ID');
    return await getString('post_id');
  }
}

  // /// Removes OTP from FlutterSecureStorage
  // static removeOtp() async {
  //   debugPrint('SharedPrefHelper : Removing OTP');
  //   await FlutterSecureStorage.delete(key: 'otp');
  // }

