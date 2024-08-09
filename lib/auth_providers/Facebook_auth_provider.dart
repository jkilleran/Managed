import 'package:como_gasto/auth_providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthenticationProvider implements AuthenticationProvider {
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  @override
  Future<AuthCredential> handleSignIn() async {
    final LoginResult loginResult = await _facebookAuth.login();

    switch (loginResult.status) {
      case LoginStatus.success:
        final AuthCredential credential = FacebookAuthProvider.credential(
          loginResult.accessToken!.token,
        );
        return credential;

      case LoginStatus.cancelled:
        throw Exception('Inicio de sesión cancelado por el usuario.');

      case LoginStatus.failed:
        throw Exception('Error en la autenticación con Facebook: ${loginResult.message}');

      default:
        throw Exception('Error desconocido en la autenticación con Facebook.');
    }
  }

  @override
  void logout() async {
    await _facebookAuth.logOut();
  }
}