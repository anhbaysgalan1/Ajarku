import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_learn/main.dart';

class FirebaseHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    final authResult = await _firebaseAuth.signInWithCredential(credential);

    final FirebaseUser user = authResult.user;
    return user;
  }

  googleSignOut() async {
    await _googleSignIn.signOut();
  }

  createNewAccount(String email, String password) async {
    final auth = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return auth;
  }
}
