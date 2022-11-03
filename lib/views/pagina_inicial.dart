import 'package:flutter/material.dart';
import '/components/side_menu.dart';
import 'em_transito.dart';
import '/views/concluidos.dart';
import '/views/novo_movimento.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key, required this.title});

  final String title;

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Em trânsito',
              ),
              Tab(
                text: 'Concluídos',
              ),
            ],
          ),
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
        body: const TabBarView(
          children: [
            EmTransito(),
            Concluidos(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FormNovoMovimento();
            }));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
