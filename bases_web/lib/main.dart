import 'package:bases_web/router/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas App',
      initialRoute:
          '/stateful', // Al agregar el slash inicial evitamos que en la url salga #stateful -> #/stateful
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
