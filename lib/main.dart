import 'package:authentication_repository/authentication_repository.dart';
import 'package:fair_and_square/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FairNSquareApp(
    transactionsRepository: TransactionsRepository(),
    authenticationRepository:
        AuthenticationRepository(firebaseAuth: FirebaseAuth.instance),
  ));
}
