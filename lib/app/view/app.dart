import 'package:authentication_repository/authentication_repository.dart';
import 'package:fair_and_square/app/bloc/app_bloc.dart';
import 'package:fair_and_square/app/routes/routes.dart';
import 'package:fair_and_square/theme.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_repository/transactions_repository.dart';

class FairNSquareApp extends StatelessWidget {
  const FairNSquareApp(
      {required TransactionsRepository transactionsRepository,
      required AuthenticationRepository authenticationRepository,
      super.key})
      : _transactionsRepository = transactionsRepository,
        _authenticationRepository = authenticationRepository;

  final TransactionsRepository _transactionsRepository;
  final AuthenticationRepository _authenticationRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _transactionsRepository),
        RepositoryProvider.value(value: _authenticationRepository),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const FairNSquareAppView(),
      ),
    );
  }
}

class FairNSquareAppView extends StatelessWidget {
  const FairNSquareAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ));
  }
}
