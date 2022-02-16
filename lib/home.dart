import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poc_google_sign/commands/login_google_command.dart';
import 'package:poc_google_sign/dto/usuario_dto.dart';
import 'package:poc_google_sign/user.dart' as usuario;
import 'package:provider/src/provider.dart';
import 'commands/logout_google_command.dart';
import 'models/app_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuarioDto? usuarioa =
        context.select<AppModel, UsuarioDto?>((value) => value.usuario);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Teste'),
        ),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print(
                '\n\n\n\nOHLA OHLA OHLAO\NOLHALOHLAOHLAOLHAOLHAO\NOLHAOLHA\n${snapshot.hasData}\n\n\n\n');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const usuario.User();
            } else if (snapshot.hasError) {
              return Text('Deu erro');
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await LoginGoogleCommand().execute();
                    },
                    child: const Text('Entrar'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await LogoutGoogleCommand().execute();
                    },
                    child: const Text('Sair'),
                  ),
                ],
              ));
            }
          },
        ));
  }
}
