import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart'; // Importa todas las pantallas

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // On/Off debug label on app
      title: 'Películas',
      initialRoute: 'home',
      // Gestiona las rutas en la aplicación
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      // Permite customizar el tema general de la aplicación
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
