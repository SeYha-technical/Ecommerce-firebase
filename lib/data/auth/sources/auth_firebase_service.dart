import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/use_crete_req.dart';
import '../model/user_sigin_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> SendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      FirebaseFirestore.instance.collection('users').doc(data.user?.uid).set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': data.user?.email,
        'gender': user.gender,
        'age': user.age,
        'image': data.user!.photoURL,
        'userId': data.user!.uid,
      });
      return Right('Signup is successfully');
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = "the password provide is to week";
      } else if (e.code == 'email-already-in-use') {
        message = "an account already exists with this email ";
      } else {
        message = e.message ?? 'An authentication error occurred';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Ages')
          .get();
      return right(returnData.docs);
    } catch (e) {
      return left("please try again");
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return Right('Signin is successfully');
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'invalid-email') {
        message = "user not found with this email";
      } else if (e.code == 'invalid-credential') {
        message = "wrong password provide for that user ";
      } else {
        message = e.message ?? 'An authentication error occurred';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> SendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right('password reset email is sent');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return Left('please try again');
    }
  }
}
