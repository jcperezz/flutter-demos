import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic>? data) {
    print(data);

    List<Widget> items = [];

    data!.forEach((element) {
      items
        ..add(ListTile(
          title: Text(element['texto']),
          leading: Icon(Icons.access_alarm_rounded),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ))
        ..add(Divider());
    });

    return items;
  }
}
