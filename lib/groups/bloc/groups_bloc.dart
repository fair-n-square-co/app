import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'package:equatable/equatable.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc({
    required TransactionsRepository transactionsRepository
    }) : _transactionsRepository=transactionsRepository, super(GroupsState()) {

    on<GroupsFetched>((event, emit) async {
      List<Group> groups = await  _transactionsRepository.getGroups();
      emit(GroupsState(status: GroupsStatus.success, groups: groups));
    });
  }

  final TransactionsRepository _transactionsRepository;
}
