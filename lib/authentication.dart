import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  String getUid() {
    final uid = user.uid;
    return uid;
  }


//SIGN UP METHOD
  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHODJ
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await _auth.signOut();

    print('signout');
  }
  void changePassword(String currentPassword, String newPassword, BuildContext context) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email??"", password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
        print("success");
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/homepage', (route) => false);
      }).catchError((error) {
        //Error, show something
        print("error");
      });
    }).catchError((err) {

    });}

  withdrawalAccount() async {
    final user = await FirebaseAuth.instance.currentUser;
    await user?.delete();
  }

}