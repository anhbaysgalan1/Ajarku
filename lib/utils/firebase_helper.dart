import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:quick_learn/main.dart';

class FirebaseHelper {
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static FirebaseAuth firebaseAuth;
  googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    final authResult = await firebaseAuth.signInWithCredential(credential);

    final FirebaseUser user = authResult.user;
    return user;
  }

  googleSignOut() async {
    await _googleSignIn.signOut();
  }

  createNewAccount(String email, String password) async {
    final auth = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return auth;
  }

  emailLogin(String email, String password) async {
    final login = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return login;
  }

  static Future<IdTokenResult> checkFirebaseToken() async {
    final currentUser = await firebaseAuth.currentUser();
    return currentUser.getIdToken();
  }

  static firebaseLogOut() {
    firebaseAuth.signOut();
    Hive.lazyBox('authBox').delete('token');
  }
}
