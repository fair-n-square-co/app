import 'dart:async';

import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart' as kinde_auth;

import 'models/user.dart';

class AuthLogOutFailure implements Exception {}

class AuthLogInFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({
    required this.kindeSdk,
  }) : token = "";

  final kinde_auth.KindeFlutterSDK kindeSdk;
  final String token;

  late final StreamController<User> _userController =
      StreamController<User>.broadcast();

  User get currentUser {
    final currentUser = kindeSdk.getUserDetails();
    return currentUser?.toUser ?? User.empty;
  }

  Future<void> logOut() async {
    try {
      await kindeSdk.logout();
      addKindeUserToStream();
    } on Exception {
      throw AuthLogOutFailure();
    }
  }

  Future<void> login() async {
    try {
      await kindeSdk.login();
      addKindeUserToStream();
    } on Exception {
      throw AuthLogInFailure();
    }
  }

  Future<void> signUp() async {
    try {
      await kindeSdk.register();
    } on Exception {
      throw AuthLogInFailure();
    }
  }

  void addKindeUserToStream() {
    final currentUser = kindeSdk.getUserDetails();
    if (!_userController.isClosed && _userController.hasListener) {
      _userController.add(currentUser?.toUser ?? User.empty);
    }
  }

  Stream<User> get user {
    return _userController.stream;
  }
}

extension on kinde_auth.UserDetails {
  User get toUser {
    return User(
      id: id,
      email: email,
      name: "$givenName $familyName".trim(),
    );
  }
}
