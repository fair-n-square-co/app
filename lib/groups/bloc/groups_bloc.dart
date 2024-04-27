import 'package:bloc/bloc.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'package:equatable/equatable.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc(this._transactionsRepository) : super(GroupsState()) {
    on<GroupsFetch>((event, emit) async {
      List<Group> groups = await _transactionsRepository.getGroups();
      emit(GroupsState(status: GroupsStatus.success, groups: groups));
    });
  }

  final TransactionsRepository _transactionsRepository;
}
