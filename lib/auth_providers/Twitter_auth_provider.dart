import 'package:como_gasto/auth_providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterAuthenticationProvider implements AuthenticationProvider {
  final TwitterLogin _twitterLogin = TwitterLogin(
    apiKey: 'YOUR_TWITTER_API_KEY',
    apiSecretKey: 'YOUR_TWITTER_API_SECRET_KEY',
    redirectURI: 'YOUR_TWITTER_REDIRECT_URI',
  );

  @override
  Future<AuthCredential> handleSignIn() async {
    final authResult = await _twitterLogin.login();

    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final authToken = authResult.authToken!;
        final authTokenSecret = authResult.authTokenSecret!;

        final AuthCredential credential = TwitterAuthProvider.credential(
          accessToken: authToken,
          secret: authTokenSecret,
        );
        return credential;

      case TwitterLoginStatus.cancelledByUser:
        throw Exception('Inicio de sesión cancelado por el usuario.');

      case TwitterLoginStatus.error:
        throw Exception('Error en la autenticación con Twitter: ${authResult.errorMessage}');

      default:
        throw Exception('Error desconocido en la autenticación con Twitter.');
    }
  }

  @override
  void logout() {
   
  }
}