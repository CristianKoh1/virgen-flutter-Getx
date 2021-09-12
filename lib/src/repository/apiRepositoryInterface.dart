import 'package:ciclicarestaurant/src/models/login.dart';
import 'package:ciclicarestaurant/src/models/singUpRequest.dart';

abstract class ApiRepositoryInterface {
  Future<LoginResponse?> login(LoginRequest login);
  Future<LoginResponse> singUp(SingUpRequest singUp);
  Future<void> logout(String _tokenFirebase, String token);
  /* Future<Conf> getConf(String token); */
}
