import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipoUno(),
          _cardTipoDos(),
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'df dsf sdfsa dsf sa fdsf sdf sdf sd fsdaf sdaf sda fsdaf sdaf sdafsaf'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoDos() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.technocrazed.com/wp-content/uploads/2015/12/Landscape-wallpaper-16.jpg'),
            placeholder: AssetImage(
                'assets/jar-loading.gif'), // Se debe agregar el recurso en el assets del pubspec.yaml
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10), child: Text('Alguna descripcion'))
        ],
      ),
    );
  }
}
