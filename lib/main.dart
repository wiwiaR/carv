import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teste/firebase_options.dart';

import 'side_menu.dart';
import 'concluidos.dart';
import 'em_transito.dart';
import 'login.dart';
import 'novo_movimento.dart';
import 'fim_movimento.dart';
import 'auth.dart';

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
        'home': (context) => const MyHomePage(title: 'Acesso e Registro'),
        'transito': (context) => const EmTransito(),
        'concluido': (context) => const Concluidos(),
        'novo': ((context) => const FormNovoMovimento()),
        'fim': (context) => const FormEncerraMovimento(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Em trânsito',
              ),
              Tab(
                text: 'Concluídos',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              MyDrawerHeader(),
              MyDrawer(),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmTransito(),
            Concluidos(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FormNovoMovimento();
            }));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  String? _dropdownValue;

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                width: 300,
                height: 500,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Novo Usuário',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'CNPJ',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                      ),
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: 'volkswagen',
                          child: Text('Volkswagen'),
                        ),
                        DropdownMenuItem(
                          value: 'audi',
                          child: Text('Audi'),
                        ),
                        DropdownMenuItem(
                          value: 'chevrolet',
                          child: Text('Chevrolet'),
                        ),
                        DropdownMenuItem(
                          value: 'toyota',
                          child: Text('Toyota'),
                        ),
                        DropdownMenuItem(
                          value: 'honda',
                          child: Text('Honda'),
                        ),
                      ],
                      value: _dropdownValue,
                      onChanged: ((value) {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          return const MyHomePage(title: 'des');
        } else {
          return const PageLogin();
        }
      },
    );
  }
}
