import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:poc_google_sign/home.dart';
import 'package:poc_google_sign/user.dart' as usuario;
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/app_model.dart';

void main() async {
  GetIt.I.registerLazySingleton<AppModel>(() => AppModel());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = GetIt.I.get<AppModel>();

    return ChangeNotifierProvider.value(
      value: appModel,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            routes: {
              '/': (_) => const Home(),
              '/user': (_) => const usuario.User(),
            },
          );
        },
      ),
    );
  }
}
