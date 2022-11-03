import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teste/backend/firebase_options.dart';

import 'views/concluidos.dart';
import 'views/em_transito.dart';
import 'views/login.dart';
import 'views/novo_movimento.dart';
import 'views/fim_movimento.dart';
import 'backend/auth.dart';
import 'views/registro.dart';
import 'views/movimentos.dart';
import 'views/pagina_inicial.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        'registro': (context) => const RegistroUsuario(),
        'home': (context) => const PaginaInicial(title: 'Acesso e Registro'),
        'transito': (context) => const EmTransito(),
        'concluido': (context) => const Concluidos(),
        'novo': ((context) => const FormNovoMovimento()),
        'fim': (context) => const FormEncerraMovimento(),
        'movimentos': (context) => const Movimentos(),
      },
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const PaginaInicial(title: 'Acesso e Registro');
        } else {
          return const PageLogin();
        }
      },
    );
  }
}
