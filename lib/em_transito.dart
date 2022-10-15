import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmTransito extends StatelessWidget {
  const EmTransito({super.key});

  @override
  Widget build(BuildContext context) {
    return CardTransito();
  }
}

class CardTransito extends StatelessWidget {
  CardTransito({super.key});

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/carro.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'PLACA',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('status'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, 'home');
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ]),
            ),
          ),
        ]);
  }
}
