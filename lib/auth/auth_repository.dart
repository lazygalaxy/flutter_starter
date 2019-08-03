import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  //TODO: abstract user
  Future<FirebaseUser> signInWithGoogle();
  Future<void> signInWithCredentials(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
  Future<bool> isAuthenticated();
  Future<String> getUserId();
}