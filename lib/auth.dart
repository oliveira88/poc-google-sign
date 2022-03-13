import 'package:flutter/material.dart';

import 'commands/login_google_command.dart';

class Auth extends StatelessWidget {
  const Auth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
