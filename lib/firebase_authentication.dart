library firebase_authentication;

import 'package:firebase_authentication/authentication_service.dart';

class FirebaseAuthentication {
  final FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();

  Future<void> signInWithEmail(String email,String password) async {
    await firebaseAuthenticationService.signInWithEmail(email,password);
  }
  Future<void> signUnWithOTP(String email,String password) async {
    await firebaseAuthenticationService.signUpWithEmail(email,password);
  }
  Future<void> signOut(String phone) async {
    await firebaseAuthenticationService.signOut();
  }

}