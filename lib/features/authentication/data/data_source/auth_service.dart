import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/authentication/data/models/age_range.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cart_bazar/features/authentication/data/models/user_info.dart';
import 'package:cart_bazar/features/authentication/data/models/user_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fpdart/fpdart.dart';

abstract class AuthDataSourceService {
  Future<Either> createUser(OnBoardUser user);
  Future<Either> getAgeRange();
  Future<Either> signInUser(UserSignIn signIn);
  Future<Either> sendPasswordReset(String email);
  Future<bool> isUserLoggedIn();
  Future<Either<Failure, UserInfoDetails>> getCurrentUserInfo();
}

final db = FirebaseFirestore.instance;

final firebaseAuth = FirebaseAuth.instance;

class AuthDataSourceServiceImpl implements AuthDataSourceService {
  @override
  Future<Either> createUser(OnBoardUser user) async {
    try {
      final createUser = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(createUser.user!.uid)
          .set({
        'uid' : createUser.user!.uid,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
      });

      return const Right('Created Successfully');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAgeRange() async {
    final List<AgeRange> ageRanges = [];
    try {
      final doc =
          await db.collection('ages').orderBy('range', descending: false).get();

      if (doc.docs.isNotEmpty) {
        ageRanges.clear();
        for (var ages in doc.docs) {
          ageRanges.add(AgeRange.fromMap(ages.data()));
        }
      }

      return Right(ageRanges);
    } on FirebaseException catch (e) {
      throw Left(e.toString());
    }
  }

  @override
  Future<Either> signInUser(UserSignIn signIn) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: signIn.email!,
        password: signIn.password!,
      );

      return const Right('Signed In successfully');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordReset(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      return const Right('Password Resend successfully, check your mail');
    } catch (e) {
      return const Left('Something went wrong.. please try again');
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return firebaseAuth.currentUser != null ? true : false;
  }

  @override
  Future<Either<Failure, UserInfoDetails>> getCurrentUserInfo() async {
    try {
      var currentUserId = firebaseAuth.currentUser!;

      final userData = await db
          .collection('Users')
          .doc(currentUserId.uid)
          .get()
          .then((value) => value.data());
      return Right(UserInfoDetails.fromJson(userData as Map<String, dynamic>));
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
