import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hitoffset/src/Auth/Api/firestore_service.dart';
import 'package:hitoffset/src/Auth/model/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firestoreService = FirestoreService();

  UserModel? currentUser;
  UserModel? get authUserser => currentUser;

  final box = GetStorage();

  Future loginWithEmail({
    required String? email,
    required String? password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      await _populateCurrentUser(authResult.user!);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Future signinWithGoogle() async {
  //   GoogleSignInAccount _user;

  //   try {
  //     var authResult = await _googleService.signIn();
  //     _user = authResult!;
  //     final googleauth = await authResult.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: googleauth.accessToken, idToken: googleauth.idToken);
  //     await FirebaseAuth.instance.signInWithCredential(credential);

  //     var user = _firebaseAuth.currentUser;
  //     currentUser = UserModel(
  //       id: user!.uid,
  //       email: user.email,
  //       name: user.displayName,
  //     );

  //     await _firestoreService.createUser(currentUser!);
  //     await _populateCurrentUser(user);
  //     return _user.id != null;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  Future signUpWithEmail({
    required String? email,
    required String? password,
    required String? name,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      // create a new user profile on firestore
      currentUser = UserModel(
        id: authResult.user!.uid,
        email: email,
        name: name,
      );

      await _firestoreService.createUser(currentUser!);
      await _populateCurrentUser(authResult.user!);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    // print(user!.displayName);
    // print(user.uid);

    if (user != null) {
      await _populateCurrentUser(user);
    }
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    currentUser = await _firestoreService.getUser(user.uid);
    box.write('name', currentUser!.name);
    box.write('id', currentUser!.id);
  }

  void logOut() {
    // _googleService.disconnect();
    _firebaseAuth.signOut();
  }
}
