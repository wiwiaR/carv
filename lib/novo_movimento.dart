import 'package:cloud_firestore/cloud_firestore.dart';
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
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _kmSaidaController = TextEditingController();
  final TextEditingController _hrSaidaController = TextEditingController();
  final TextEditingController _tecnicoController = TextEditingController();

  String botao = 'Registrar';
  bool salvo = false;
  bool statusBotao = true;
  var _idMovimento;

  @override
  void initState() {
    super.initState();

    _hrSaidaController.text = DateFormat.Hm().format(_now);
  }

  @override
  void dispose() {
    _placaController.dispose();
    _kmSaidaController.dispose();
    _hrSaidaController.dispose();
    _tecnicoController.dispose();
    super.dispose();
  }

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
              enabled: statusBotao,
              textCapitalization: TextCapitalization.characters,
              controller: _placaController,
              decoration: const InputDecoration(
                labelText: 'Placa',
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            TextFormField(
              enabled: statusBotao,
              controller: _hrSaidaController,
              decoration: const InputDecoration(
                labelText: 'Hora de saída',
              ),
            ),
            TextFormField(
              enabled: statusBotao,
              controller: _kmSaidaController,
              decoration: const InputDecoration(
                labelText: 'Quilometragem de saída',
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              enabled: statusBotao,
              controller: _tecnicoController,
              decoration: const InputDecoration(
                labelText: 'Técnico',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    salvarArquivo();
                    salvo = true;
                    statusBotao = !statusBotao;
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

  Future salvarArquivo() async {
    final placa = _placaController.text;
    final hrSaida = _hrSaidaController.text;
    final kmSaida = _kmSaidaController.text;
    final tecnico = _tecnicoController.text;

    if (salvo == false) {
      final novoDoc = FirebaseFirestore.instance.collection('movimentos').doc();

      final json = {
        'placa': placa,
        'hr_saida': hrSaida,
        'km_saida': kmSaida,
        'tecnico': tecnico,
        'status': false
      };

      await novoDoc.set(json);
      _idMovimento = novoDoc.id;
    } else {
      final editDoc =
          FirebaseFirestore.instance.collection('movimentos').doc(_idMovimento);

      final json = {
        'placa': placa,
        'hr_saida': hrSaida,
        'km_saida': kmSaida,
        'tecnico': tecnico,
        'status': false
      };

      await editDoc.update(json);
    }
  }
}
