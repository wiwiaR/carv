import 'package:flutter/material.dart';
import 'package:teste/components/card_transito.dart';

class Concluidos extends StatelessWidget {
  const Concluidos({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.name == 'concluido') {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Concluído'),
        ),
        body: CardTransito(
          status: 'completo',
        ),
      );
    } else {
      return Scaffold(
        body: CardTransito(
          status: 'completo',
        ),
      );
    }
  }
}
