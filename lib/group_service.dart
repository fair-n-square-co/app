
import 'package:fair_n_square/fairnsquare/transactions/v1alpha1/group.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class ListGroupsAPI {
  String baseUrl = 'localhost';

  ListGroupsAPI._internal();
  static final ListGroupsAPI _instance = ListGroupsAPI._internal();

  factory ListGroupsAPI() => _instance;

  static ListGroupsAPI get instance => _instance;

  late GroupServiceClient _groupServiceClient;

  Future<void> init() async {
    _createChannel();
  }

  GroupServiceClient get groupServiceClient {
    return _groupServiceClient;
  }

  _createChannel() {
    final channel = ClientChannel(
      baseUrl,
      port: 8080,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _groupServiceClient = GroupServiceClient(channel);
  }
}
