import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin FirebaseAuthMixin {
  Future signInAnonymously();

  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      {required String Email, required String Password});

  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      {required String Email, required String Password});

  Future<Map<String, dynamic>> signInWithGoogle();

  Future<void> signOut();
}

class FireBaseAuthHelper with FirebaseAuthMixin {
  FireBaseAuthHelper._();

  static final FireBaseAuthHelper fireBaseAuthHelper = FireBaseAuthHelper._();

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future signInAnonymously() async {
    Map<String, dynamic> data = {};
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();

      User? user = userCredential.user;

      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "admin-restricted-operation":
          data['msg'] = "This service is temporary down.";
        default:
          data['msg'] = "";
      }
    }
    print(data);
    return data;
  }

  @override
  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      {required String Email, required String Password}) async {
    Map<String, dynamic> data = {};

    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: Email, password: Password);

      User? user = userCredential.user;
      print("---------------------");
      print(user);
      print("---------------------");
      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "admin-restricted-operation":
          data['msg'] = "This Service is temporary down.";
        case "weak-password":
          data['msg'] = "Password must be at-least 6 char.";
        case "email-already-in-use":
          data['msg'] = "This e-mail id is already exists.";
        case "A network error (such as timeout, interrupted connection or unreachable host) has occurred.":
          data['msg'] = "Please check your internet connection.";
        case "The email address is badly formatted.":
          data['msg'] = "email format is not proper";
        default:
          data['msg'] = "";
      }
    }
    print(data);
    return data;
  }

  @override
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      {required String Email, required String Password}) async {
    Map<String, dynamic> data = {};
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: Email, password: Password);

      User? user = userCredential.user;

      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "admin-restricted-operation":
          data['msg'] = "This service is temporary down.";
        case "wrong-password":
          data['msg'] = "Password is wrong...";
        case "user-not -found":
          data['msg'] = "User does not exists with this e-mail id.";
        case "user-disabled":
          data['msg'] = "User is disable,contact admin for this.";
        default:
          data['msg'] = "";
      }
    }
    print(data);
    return data;
  }

  @override
  Future<Map<String, dynamic>> signInWithGoogle() async {
    Map<String, dynamic> data = {};
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;

      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "admin-restricted-operation":
          data['msg'] = "This service is temporary down.";
        case "There is no user record corresponding to this identifier":
          data['msg'] = "This user is not available.";
        default:
          data['msg'] = e.code;
      }
    }
    print(data);
    return data;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
