import 'package:flutter/material.dart';
import 'package:teste/components/card_transito.dart';

class EmTransito extends StatelessWidget {
  const EmTransito({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.name == 'transito') {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Em trânsito'),
        ),
        body: CardTransito(
          status: 'incompleto',
        ),
      );
    } else {
      return Scaffold(
        body: CardTransito(
          status: 'incompleto',
        ),
      );
    }
  }
}
