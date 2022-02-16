import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'dto/usuario_dto.dart';
import 'models/app_model.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuarioDto usuario =
        context.select<AppModel, UsuarioDto?>((value) => value.usuario)!;

    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(usuario.photoUrl!),
          ),
          Text('Nome: ${usuario.nome}'),
          Text('Email: ${usuario.email}')
        ],
      ),
    );
  }
}
