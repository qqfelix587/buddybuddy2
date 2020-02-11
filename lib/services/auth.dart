import 'package:buddybuddy/models/user.dart';
import 'package:buddybuddy/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:buddybuddy/services/usermanagement.dart';
import 'package:flutter/material.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    if(user!=null && user.isEmailVerified == true) {
      return User(user: user);
    }
    else
      return null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }


  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      if( user != null && user.isEmailVerified == true) {
        return _userFromFirebaseUser(user);
      }
      else {
        return null;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
//        .then((signedInUser){
//          var userUpdateInfo = new UserUpdateInfo();
//          userUpdateInfo.displayName = email;
//          userUpdateInfo.photoUrl = 'https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjTm-a2lfTmAhWOMN4KHYGKDFsQjRx6BAgBEAQ&url=https%3A%2F%2Fm.blog.naver.com%2FPostView.nhn%3FblogId%3Dbokun99%26logNo%3D221316509635&psig=AOvVaw22E7u1t0kQxdFCzYlAaCVh&ust=1578578531145047';
//          FirebaseAuth.instance.
//          updateProfile(userUpdateInfo).then((user){
//            FirebaseAuth.instance.current().then((user) => {
//            UserManegement().storeNewUser(signedInUser, context);
//            });
//          });


    FirebaseUser user = result.user;
    // create a new document for the user with the uid

      await user.sendEmailVerification();
      //await DatabaseService(uid: user.uid).updateUserData(
      //    '0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    }
//    catch(error){
//print(error.toString());
//return null;
//}
//}

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}