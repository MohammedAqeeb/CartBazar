import 'package:cart_bazar/features/authentication/data/models/age_range.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fpdart/fpdart.dart';

abstract class AuthDataSourceService {
  Future<Either> createUser(OnBoardUser user);
  Future<Either> getAgeRange();
}

class AuthDataSourceServiceImpl implements AuthDataSourceService {
  @override
  Future<Either> createUser(OnBoardUser user) async {
    try {
      final createUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(createUser.user!.uid)
          .set({
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
      final doc = await FirebaseFirestore.instance
          .collection('ages')
          .orderBy('range', descending: false)
          .get();

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
}
