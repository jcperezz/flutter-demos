import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {}

  Future<List<dynamic>> cargarDatos() async {
    final resp = await rootBundle.loadString(
        'data/opciones.json'); // Se debe agregar el recurso en el assets del pubspec.yaml

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
