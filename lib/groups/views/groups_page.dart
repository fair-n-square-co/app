import 'package:fair_and_square/app/app.dart';
import 'package:fair_and_square/groups/bloc/groups_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_repository/transactions_repository.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: GroupsPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupsBloc(context.read<TransactionsRepository>()),
      child: const GroupsView(),
    );
  }
}

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<StatefulWidget> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Fair_n_Square"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<GroupsBloc, GroupsState>(
          //Check if initial state - empty page
          // call fetch event
          //Check if fetched state - display list view
          builder: (context, state) {
            context.read<GroupsBloc>().add(const GroupsFetch());
            switch (state.status) {
              case GroupsStatus.initial:
                return const Text("Initial");
              case GroupsStatus.success:
                return ListView.builder(
                    itemCount: state.groups.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.groups[index].id),
                        subtitle: Text(state.groups[index].name),
                      );
                    });
              case GroupsStatus.loading:
                return const Text("Loading");
              case GroupsStatus.failure:
                return const Text("Failure");
            }
          },
          listener: (context, state) {
            if (state.status.isInitial) {
              context.read<GroupsBloc>().add(const GroupsFetch());
            }
          },
        ),
      ),
    );
  }
}
