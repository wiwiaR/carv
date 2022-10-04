import 'package:intl/intl.dart';

import 'side_menu.dart';

import 'package:flutter/material.dart';

class FormNovoMovimento extends StatefulWidget {
  const FormNovoMovimento({super.key});

  @override
  State<FormNovoMovimento> createState() => _FormNovoMovimentoState();
}

class _FormNovoMovimentoState extends State<FormNovoMovimento> {
  final DateTime _now = DateTime.now();
  String botao = 'Registrar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Movimento'),
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset('assets/images/carro.jpg'),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Placa',
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            TextFormField(
              initialValue: DateFormat.Hm().format(_now),
              decoration: const InputDecoration(
                labelText: 'Hora de saída',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quilometragem de saída',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Técnico',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (botao == 'Registrar') {
                      botao = 'Editar';
                    } else {
                      botao = 'Registrar';
                    }
                  });
                },
                child: Text(botao),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
