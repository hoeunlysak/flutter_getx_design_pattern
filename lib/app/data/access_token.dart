import 'package:get_storage/get_storage.dart';

class AccessToken {
  static final GetStorage _storage = GetStorage();

  static const String _accessToken = "ACCESS_TOKEN";
  static const String _refreshToken = "REFRESH_TOKEN";
  static const String _username = "USERNAME";

  static void saveToken({
    String? token,
    String? refresh,
    String? username,
  }) {
    _storage.write(_accessToken, token);
    _storage.write(_refreshToken, refresh);
    _storage.write(_username, username);
  }

  static void removeToken() {
    _storage.remove(_accessToken);
    _storage.remove(_refreshToken);
    _storage.remove(_username);
  }

  static String getToken() =>
      _storage.read<String>(_accessToken) ?? "";

  static String getRefreshToken() =>
      _storage.read<String>(_refreshToken) ?? "";

  static String getUserName() =>
      _storage.read<String>(_username) ?? "";
}