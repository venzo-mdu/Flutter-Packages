library supabase_authentication;

import 'package:supabase_authentication/authentication_service.dart';

class SupabaseAuthentication {
  final SupabaseAuthenticationService supabaseAuthenticationService = SupabaseAuthenticationService();

  Future<void> signInWithOTP(String email) async {
    await supabaseAuthenticationService.signInWithOTP(email);
  }
  verifyOtp(String email,String token) async {
    await supabaseAuthenticationService.verifyOTP(email,token);
  }
  resendOtp(String email) async {
    await supabaseAuthenticationService.resendOtp(email);
  }

  forgotPasswordMail(String email) async {
    await supabaseAuthenticationService.forgotPasswordMail(email);
  }

  forgotPassword(String email, String token, String password) async {
    await supabaseAuthenticationService.forgotPassword(email,token,password);
  }
  updatePassword(String password) async {
    await supabaseAuthenticationService.updatePassword(password);
  }
}