import 'package:fair_n_square/fairnsquare/transactions/v1alpha1/group.pbgrpc.dart' as grouppb;
import 'package:transactions_repository/src/apis/transactions_api.dart';
import 'model/group.dart';


class TransactionsRepository {

  TransactionsRepository() {
    GroupsAPI().init();
  }

  Future<List<Group>> getGroups() async {
    final groupsResponse = await GroupsAPI.instance.groupServiceClient.listGroups(grouppb.ListGroupsRequest());
    return getGroupsfromProto(groupsResponse); 
  }

  List<Group> getGroupsfromProto(grouppb.ListGroupsResponse response) {

    List<Group> groups = [];

    for (var element in response.groups) {
      groups.add(Group(id: element.id, name: element.name));
    }

    return groups;
  }
}
