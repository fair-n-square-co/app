part of 'groups_bloc.dart';

sealed class GroupsEvent {
  const GroupsEvent();
}

final class GroupsFetched extends GroupsEvent {
  const GroupsFetched({required this.groups});
  final List<Group> groups;  
}
