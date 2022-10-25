import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmTransito extends StatelessWidget {
  const EmTransito({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.name == 'transito') {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Em trânsito'),
        ),
        body: CardTransito(),
      );
    } else {
      return Scaffold(
        body: CardTransito(),
      );
    }
  }
}

class CardTransito extends StatelessWidget {
  CardTransito({super.key});

  final db = FirebaseFirestore.instance.collection('movimentos');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: db.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    documentSnapshot["placa"]
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                      documentSnapshot["tecnico"].toString()),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(
                                      context, 'movimentos');
                                },
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
          );
        }
      },
    );
  }
}
