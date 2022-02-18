import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'commands/logout_google_command.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(usuario.photoURL!),
          ),
          const SizedBox(height: 8),
          Text('Nome: ${usuario.displayName}'),
          const SizedBox(height: 8),
          Text('Email: ${usuario.email}'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              await LogoutGoogleCommand().execute();
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
