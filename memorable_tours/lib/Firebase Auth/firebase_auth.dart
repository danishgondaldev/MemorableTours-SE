import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (error) {
      print('Error during email/password signup: $error');
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (error) {
      print('Error during email/password sign-in: $error');
      return null;
    }
  }

  Future<void> sendVerificationEmail(User user) async {
    await user.sendEmailVerification();
  }

  Future<User?> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      user = _auth.currentUser;
    }
    return user;
  }
}
