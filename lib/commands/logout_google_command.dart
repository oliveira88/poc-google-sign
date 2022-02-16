import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../dto/usuario_dto.dart';
import './base_command.dart';

class LogoutGoogleCommand extends BaseCommand {
  Future<void> execute() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
