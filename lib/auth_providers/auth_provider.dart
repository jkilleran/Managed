
import 'package:como_gasto/auth_providers/google_auth_provider.dart';
import 'package:como_gasto/auth_providers/Twitter_auth_provider.dart';
import 'package:como_gasto/auth_providers/Facebook_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum LoginProvider {
  GOOGLE,
  TWITTER,
  FACEBOOK,
}

class AuthenticationProviderFactory {
  const AuthenticationProviderFactory();

  AuthenticationProvider createAuthProvider(LoginProvider provider) {
    switch (provider) {
      case LoginProvider.GOOGLE:
        return GoogleAuthenticationProvider();
        break;
      case LoginProvider.TWITTER:
      return TwitterAuthenticationProvider();
        break;
      case LoginProvider.FACEBOOK:
      return FacebookAuthenticationProvider();
        break;
    }
    return throw Exception("Error al intentar autenticarte.");
  }
}

abstract class AuthenticationProvider {
  Future<AuthCredential> handleSignIn();
  void logout();
}
