import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signUpWithGoogle() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // User canceled the sign-in
        return null;
      }

      // Obtain GoogleSignInAuthentication
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      // Sign in with Google credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      return result.user;
    } catch (error) {
      print('Error during Google Sign-Up: $error');
      return null;
    }
  }

  // Function to be called when the Google Sign-Up button is pressed
  Future<void> onPressedGoogleSignIn() async {
    User? user = await signUpWithGoogle();
    if (user != null) {
      // Google Sign-Up was successful, you can navigate to the next screen or perform other actions
    } else {
      // Handle the case where Google Sign-Up failed
    }
  }
}
