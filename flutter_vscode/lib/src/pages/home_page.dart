import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final textStyle = TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola mundo',
              style: textStyle,
            ),
            Text(
              '0',
              style: textStyle,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print('Hola mundo')},
        child: Icon(Icons.add),
      ),
    );
  }
}
