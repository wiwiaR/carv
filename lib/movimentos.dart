import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'side_menu.dart';

class Movimentos extends StatelessWidget {
  Movimentos({super.key});

  final db = FirebaseFirestore.instance.collection('movimentos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimentos do veículo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: Transito(db: db), // AccountDrawer
    );
  }
}

class Transito extends StatelessWidget {
  const Transito({
    Key? key,
    required this.db,
  }) : super(key: key);

  final CollectionReference<Map<String, dynamic>> db;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/carro.jpg',
            width: 200,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Text('placa'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Text('Em trânsito'),
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: db.snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                  );
          },
        ),
      ],
    );
  }
}
