import 'package:flutter/material.dart';
import 'side_menu.dart';
import 'package:intl/intl.dart';

class FormEncerraMovimento extends StatefulWidget {
  const FormEncerraMovimento({super.key});

  @override
  State<FormEncerraMovimento> createState() => _FormEncerraMovimentoState();
}

class _FormEncerraMovimentoState extends State<FormEncerraMovimento> {
  final DateTime _now = DateTime.now();
  String botao = 'Registrar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encerrar Movimento'),
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
              initialValue: 'Placa',
              readOnly: true,
            ),
            TextFormField(
              initialValue: DateFormat.Hm().format(_now),
              decoration: const InputDecoration(
                labelText: 'Hora de entrada',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quilometragem de entrada',
              ),
            ),
            TextFormField(
              initialValue: 'Técnico',
              readOnly: true,
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
