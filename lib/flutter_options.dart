import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

Future<void> initializeKindeSDK() async {
  await dotenv.load(fileName: ".env");
  await KindeFlutterSDK.initializeSDK(
    authDomain: dotenv.env['KINDE_AUTH_DOMAIN']!,
    authClientId: dotenv.env['KINDE_AUTH_CLIENT_ID']!,
    loginRedirectUri: dotenv.env['KINDE_LOGIN_REDIRECT_URI']!,
    logoutRedirectUri: dotenv.env['KINDE_LOGOUT_REDIRECT_URI']!,
    // audience: dotenv.env['KINDE_AUDIENCE'], //optional
    scopes: ["email", "profile", "offline", "openid"], // optional,
  );
}
