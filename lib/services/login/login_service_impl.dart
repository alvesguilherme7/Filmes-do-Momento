import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {

  LoginRepository _loginRepository;

  LoginServiceImpl({required LoginRepository loginRepository}) : this._loginRepository = loginRepository;

  @override
  Future<UserCredential> login() {
    return _loginRepository.login();
  }

  @override
  Future<void> logout() => _loginRepository.logout();

}