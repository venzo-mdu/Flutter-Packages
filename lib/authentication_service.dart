import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthenticationService {

  signUp(String email,String password) async {
    await Supabase.instance.client.auth.signUp(email:email,password: password);
  }

  signInWithOTP(String email) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithOtp(email: email);
      return 'Success';
    } catch (e) {
      return e;
    }
  }

  verifyOTP(String email, String token) async {
    try {
      final AuthResponse res = await Supabase.instance.client.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.email,
      );
      final Session? session = res.session;
      final User? user = res.user;
      return 'Success';
    } catch (e) {
      return e;
    }
  }

  resendOtp(String email) async {
    try {
      final ResendResponse res = await Supabase.instance.client.auth.resend(
        type: OtpType.email,
        email: email,
      );
      return 'Success';
    } catch (e) {
      return e;
    }
  }

  forgotPasswordMail(String email) async {
    try {
      final response = await Supabase.instance.client.auth.resetPasswordForEmail(email);
      return 'Success';
    } catch (error) {
      return error;
    }
  }

  forgotPassword(String email, String token, String password) async {
    try {
      final recovery = await Supabase.instance.client.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.recovery,
      );
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(
          password: password,
        ),
      );
      return 'Success';
    } catch (error) {
      return error;
    }
  }

  updatePassword(String password) async {
    final UserResponse res = await Supabase.instance.client.auth.updateUser(
      UserAttributes(
        password: password,
      ),
    );
    final User? updatedUser = res.user;
    return updatedUser;
  }

}