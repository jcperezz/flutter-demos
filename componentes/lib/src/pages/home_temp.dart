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
          children: _crearOpcionesCorto(),
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

  List<Widget> _crearOpcionesCorto() {
    return _opciones
        .map((e) => Column(
              children: [
                ListTile(
                  title: Text(e),
                  subtitle: Text(e + ' subtitulo'),
                  leading: Icon(Icons.access_alarm_rounded),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
