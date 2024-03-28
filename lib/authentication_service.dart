import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {

  Future<void> signInWithOTP(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      verificationCompleted(AuthCredential authResult) {
        print('Phone number automatically verified and user signed in: $authResult');
      }

      verificationFailed(FirebaseAuthException authException) {
        print('Phone number verification failed: $authException');
      }

      codeSent(String verificationId, [int? forceResend]) {
        print('Verification code sent to the phone number: $verificationId');
      }

      codeAutoRetrievalTimeout(String verificationId) {
        print('Auto retrieval timeout: $verificationId');
      }

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(minutes: 3),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print('Error signing in with OTP: $e');
    }
  }

  signInWithEmail(String email,String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.code;
    }
  }
  signUpWithEmail(String email,String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.code;
    }
  }
  signOut() async {
    await FirebaseAuth.instance.signOut();
    return 'Success';
  }

}