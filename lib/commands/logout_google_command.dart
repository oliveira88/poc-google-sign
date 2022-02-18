import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './base_command.dart';

class LogoutGoogleCommand extends BaseCommand {
  Future<void> execute() async {
    try {
      await GoogleSignIn().disconnect();
    } catch (err) {
      print('ERROR: Nenhum usuario logado {$err}');
    }
    FirebaseAuth.instance.signOut();
  }
}
