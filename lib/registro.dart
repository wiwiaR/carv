import 'package:flutter/material.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  String? _dropdownValue;

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                width: 300,
                height: 500,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Novo Usuário',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'CNPJ',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                      ),
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: 'volkswagen',
                          child: Text('Volkswagen'),
                        ),
                        DropdownMenuItem(
                          value: 'audi',
                          child: Text('Audi'),
                        ),
                        DropdownMenuItem(
                          value: 'chevrolet',
                          child: Text('Chevrolet'),
                        ),
                        DropdownMenuItem(
                          value: 'toyota',
                          child: Text('Toyota'),
                        ),
                        DropdownMenuItem(
                          value: 'honda',
                          child: Text('Honda'),
                        ),
                      ],
                      value: _dropdownValue,
                      onChanged: ((value) {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}