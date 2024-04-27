import 'package:fair_and_square/groups/views/groups_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FairNSquareApp(transactionsRepository: TransactionsRepository()));
}

class FairNSquareApp extends StatelessWidget {
  const FairNSquareApp(
      {required TransactionsRepository transactionsRepository, super.key})
      : _transactionsRepository = transactionsRepository;

  final TransactionsRepository _transactionsRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _transactionsRepository,
      child: const FairNSquareAppView(),
    );
  }
}

class FairNSquareAppView extends StatelessWidget {
  const FairNSquareAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const GroupsPage(),
    );
  }
}
