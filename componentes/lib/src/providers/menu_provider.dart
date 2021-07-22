import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  MenuProvider() {
    cargarDatos();
  }

  void cargarDatos() {
    rootBundle.loadString('data/opciones.json')
    .then((value) => {
      print(value);
    });
  }
}
