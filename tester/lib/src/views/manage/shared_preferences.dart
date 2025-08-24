import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _keyIsLoggedIn = "isLoggedIn";
  static const String _keyUserType = "userType";

  // Lưu thông tin trạng thái đăng nhập
  static Future<void> setLoginStatus(bool isLoggedIn, String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
    await prefs.setString(_keyUserType, userType);
  }

  // Lấy trạng thái đăng nhập
  static Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Lấy loại người dùng
  static Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserType);
  }

  // Đăng xuất người dùng
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
    await prefs.remove(_keyUserType);
  }
}
