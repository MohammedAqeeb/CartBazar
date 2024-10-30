import 'dart:developer';

import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/settings/data/models/completed_orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CompletedOrdersDataSource {
  Future<Either<Failure, List<CompletedOrders>>> getOrderStatus();
}

class CompletedOrdersSourceImp implements CompletedOrdersDataSource {
  @override
  Future<Either<Failure, List<CompletedOrders>>> getOrderStatus() async {
    print('called service');
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    List<CompletedOrders> completedOrders = [];

    try {
      final query =
          await db.collection('Users').doc(user!.uid).collection('Order').get();

      if (query.docs.isNotEmpty) {
        for (var status in query.docs) {
          debugPrint(status.data().toString());
          completedOrders.add(CompletedOrders.fromJson(status.data()));
        }
      } else {
        return Left(Failure('No Orders To display'));
      }
      return Right(completedOrders);
    } catch (e) {
      debugPrint(e.toString());

      return Left(Failure('Unable to Fetch Orders'));
    }
  }
}
