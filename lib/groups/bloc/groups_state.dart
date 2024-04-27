part of 'groups_bloc.dart';

enum GroupsStatus { initial, loading, success, failure }

extension GroupsStatusX on GroupsStatus {
  bool get isInitial => this == GroupsStatus.initial;
  bool get isLoading => this == GroupsStatus.loading;
  bool get isSuccess => this == GroupsStatus.success;
  bool get isFailure => this == GroupsStatus.failure;
}

class GroupsState extends Equatable {

  GroupsState({
    this.status = GroupsStatus.initial,
    List<Group>? groups,
  }) : groups = groups ?? List.empty();

  final GroupsStatus status;
  final List<Group> groups; 

  @override
  List<Object?> get props => [status, groups];
}

