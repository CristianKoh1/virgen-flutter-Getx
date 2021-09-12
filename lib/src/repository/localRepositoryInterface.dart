import 'package:ciclicarestaurant/src/models/login.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
  Future<LoginRequest?> getLogin();
  Future<void> saveLogin(LoginRequest _loginRequest);
  Future<String> saveToken(String token);
  Future<void> saveName(String name);
  Future<String?> getName();
  Future<String> saveTokenFirebase(String token);
  Future<String?> getTokenFirebase();
  Future<void> clearAllData();
}
