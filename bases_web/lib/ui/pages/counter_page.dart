import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:bases_web/ui/shared/my_custom_button.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppMenu(),
          Spacer(),
          FittedBox(
            // Permite un manejo responsive del contenido
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Contador: ${this._counter}',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCustomButton(onPress: _increase, title: 'Incrementar'),
              MyCustomButton(onPress: _decrease, title: 'Decrementar'),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
