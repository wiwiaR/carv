import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Movimentos extends StatefulWidget {
  const Movimentos({super.key});

  @override
  State<Movimentos> createState() => _MovimentosState();
}

class _MovimentosState extends State<Movimentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimentos'),
      ),
    );
  }
}
