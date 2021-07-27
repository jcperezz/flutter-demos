import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_blockSlider)
          ? null
          : (value) {
              setState(() {
                _valorSlider = value;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.efeverde.com/storage/2018/11/Jaguar-madre-cr%C3%ADa-caricias-476x310.jpg'),
      width: _valorSlider,
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _blockSlider,
    //   onChanged: (valor) {
    //     setState(() {
    //       _blockSlider = valor!;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockSlider,
      onChanged: (valor) {
        setState(() {
          _blockSlider = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockSlider,
      onChanged: (valor) {
        setState(() {
          _blockSlider = valor;
        });
      },
    );
  }
}
