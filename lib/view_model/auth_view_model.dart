import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:products_app/data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewModel({required AuthRepository authRepository}):
     _authRepository = authRepository;

 signIn({required String email, required String password}) {
  _authRepository.signIn(email: email, password: password);
 } 

 signUp({required String email, required String password}) =>
  _authRepository.signUp(email: email, password: password);

  Stream<User?> checkAuthState() => _authRepository.authState();
}