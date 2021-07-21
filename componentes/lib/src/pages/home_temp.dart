import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componente Temp'),
        ),
        body: ListView(
          children: _crearOpciones(),
        ),
      ),
    );
  }

  List<Widget> _crearOpciones() {
    List<Widget> ops = [];

    for (String item in _opciones) {
      ops
        ..add(ListTile(
          title: Text(item),
        ))
        ..add(Divider());
    }

    return ops;
  }
}
