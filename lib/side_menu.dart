import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: const Text('Em trânsito'),
            onTap: () {
              Navigator.popAndPushNamed(context, 'transito');
            },
          ),
          ListTile(
            title: const Text('Movimentos Concluídos'),
            onTap: () {
              Navigator.popAndPushNamed(context, 'concluido');
            },
          ),
          ListTile(
            title: const Text('Novo Movimento'),
            onTap: () {
              Navigator.popAndPushNamed(context, 'novo');
            },
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Entre em contato'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('logout'),
            onTap: () {
              signOut();
            },
          ),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }
}

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'CARV',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Usuário',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
