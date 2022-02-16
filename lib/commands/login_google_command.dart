import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../dto/usuario_dto.dart';
import './base_command.dart';

class LoginGoogleCommand extends BaseCommand {
  Future<UserCredential> execute() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    appModel.usuario = UsuarioDto()
      ..nome = googleUser?.displayName
      ..apelido = "mpirovani"
      ..email = googleUser?.email
      ..photoUrl = googleUser?.photoUrl;
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
