import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../dto/usuario_dto.dart';
import './base_command.dart';

class LoginGoogleCommand extends BaseCommand {
  Future<void> execute() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      appModel.usuario = UsuarioDto()
        ..nome = googleUser?.displayName ?? 'semnome'
        ..apelido = "mpirovani"
        ..email = googleUser?.email ?? 'sememail'
        ..photoUrl = googleUser?.photoUrl ?? 'semphoto';
    } on FirebaseAuthException catch (err) {
      print('Erro no login: ${err.message}');
    }
  }
}
