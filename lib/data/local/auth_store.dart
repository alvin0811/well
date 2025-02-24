import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_path/data/local/models/auth_user.dart';

@singleton
class AuthStore {
  static const String _keyToken = 'token';
  static const String _keyDeviceUuid = 'deviceUUID';
  static const String _keyUser = 'user';
  static const String _keyMediaId = 'MediaId';
  static const String _keyRememberMe = 'rememberMe';
  static const String _keyBioMetricEnabled = 'bioMetricEnabled';
  static const String _keyIsComingFromSettings = 'iscomingfromsettings';
  static const String _isDateChange = 'isDateChanged';
  static const String _healthCheckTracker = 'healthCheckTracker';
  static const String _question = 'question';
  static const String _answer = 'answer';

  static const String _email = 'email';
  static const String _password = 'password';

  SharedPreferences? _sharedPreferences;

  Future<void> setUserDetails(String email, String password) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(_email, email);
    await sharedPreferences.setString(_password, password);
  }

  Future<String?> getUserEmail() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getString(_email);
  }

  Future<String?> getUserPassword() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getString(_password);
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<bool> loggedIn() async {
    final user = await getUser();
    final token = await getToken();
    final rememberMe = await getRememberMe();
    return user != null &&
        token != null &&
        rememberMe != null &&
        rememberMe == true;
  }

  Future<void> signOut() async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.remove(_keyToken);
    await sharedPreferences.remove(_keyDeviceUuid);
    await sharedPreferences.remove(_keyUser);
    await sharedPreferences.remove(_keyMediaId);
    await sharedPreferences.remove(_keyRememberMe);
    // await sharedPreferences.remove(_keyBioMetricEnabled);
    await sharedPreferences.remove(_keyIsComingFromSettings);
  }

  Future<void> setSession(
    String authToken,
    String deviceUuid,
    AuthUser? user,
  ) async {
    await setToken(authToken);
    await setDeviceUUID(deviceUuid);
    if (user != null) {
      await setUser(user);
    }
  }

  Future<String?> getToken() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getString(_keyToken);
  }

  Future<void> setToken(String value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(_keyToken, value);
  }

  Future<String?> getDeviceUUID() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getString(_keyDeviceUuid);
  }

  Future<void> setDeviceUUID(String value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(_keyDeviceUuid, value);
  }

  Future<AuthUser?> getUser() async {
    final sharedPreferences = await _getSharedPreferences();
    final jsonUser = sharedPreferences.getString(_keyUser);
    if (jsonUser == null) {
      return null;
    }
    return AuthUser.fromJson(jsonDecode(jsonUser));
  }

  Future<void> setUser(AuthUser authUser) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(_keyUser, jsonEncode(authUser.toJson()));
  }

  Future<bool?> getRememberMe() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getBool(_keyRememberMe);
  }

  Future<void> setRememberMe(bool value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setBool(_keyRememberMe, value);
  }

  Future<bool?> getIsBioMetricEnabled() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getBool(_keyBioMetricEnabled);
  }

  Future<void> setIsBioMetricEnabled(bool value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setBool(_keyBioMetricEnabled, value);
  }

  Future<bool?> getIsComingFromSettings() async {
    final sharedPreferences = await _getSharedPreferences();
    final isComingFromSettings =
        sharedPreferences.getBool(_keyIsComingFromSettings);
    if (isComingFromSettings == null) {
      return null;
    }
    return isComingFromSettings;
  }

  Future<void> setIsComingFromSettings(bool isComingfromsettings) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setBool(
        _keyIsComingFromSettings, isComingfromsettings);
  }

  Future<int?> getMediaId() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getInt(_keyMediaId);
  }

  Future<void> setMediaId(int value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setInt(_keyMediaId, value);
  }

  Future<String?> getisDateChange() async {
    final sharedPreferences = await _getSharedPreferences();
    final isDateChange = sharedPreferences.getString(_isDateChange);
    if (isDateChange == null) {
      return null;
    }
    return isDateChange;
  }

  Future<void> setisDateChange(String isDateChange) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(_isDateChange, isDateChange);
  }

  Future<int?> gethealthCheckTracker() async {
    final sharedPreferences = await _getSharedPreferences();
    final healthCheckTracker = sharedPreferences.getInt(_healthCheckTracker);
    if (healthCheckTracker == null) {
      return null;
    }
    return healthCheckTracker;
  }

  Future<void> sethealthCheckTracker(int healthCheckTracker) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setInt(_healthCheckTracker, healthCheckTracker);
  }

  Future<int?> getquestion() async {
    final sharedPreferences = await _getSharedPreferences();
    final healthCheckTracker = sharedPreferences.getInt(_question);
    if (healthCheckTracker == null) {
      return null;
    }
    return healthCheckTracker;
  }

  Future<void> setquestion(int question) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setInt(_question, question);
  }

  Future<int?> getanswer() async {
    final sharedPreferences = await _getSharedPreferences();
    final healthCheckTracker = sharedPreferences.getInt(_answer);
    if (healthCheckTracker == null) {
      return null;
    }
    return healthCheckTracker;
  }

  Future<void> setanswer(int answer) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setInt(_answer, answer);
  }
}
