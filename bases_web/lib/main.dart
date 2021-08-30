import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas App',
      initialRoute:
          '/stateful', // Al agregar el slash inicial evitamos que en la url salga #stateful -> #/stateful
      routes: {
        '/stateful': (_) => CounterPage(),
        '/provider': (_) => CounterProviderPage(),
      },
    );
  }
}
