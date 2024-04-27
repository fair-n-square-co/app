part of 'groups_bloc.dart';

sealed class GroupsEvent {
  const GroupsEvent();
}

final class GroupsFetch extends GroupsEvent {
  const GroupsFetch();
}

// final class GroupsFetched extends GroupsEvent {
//   const GroupsFetch({required groups})
//   final List<Group> groups;
// }
