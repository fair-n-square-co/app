import 'package:fair_n_square/fairnsquare/transactions/v1alpha1/group.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GroupsAPI {
  String baseUrl = 'localhost';
  int port = 8080;

  GroupsAPI._internal();

  static final GroupsAPI _instance = GroupsAPI._internal();

  factory GroupsAPI() => _instance;

  static GroupsAPI get instance => _instance;

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
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _groupServiceClient = GroupServiceClient(channel);
  }
}