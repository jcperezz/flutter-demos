import 'package:flutter/material.dart';

class HttpNotFoundPage extends StatelessWidget {
  const HttpNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pagina no existe'),
              Text('404',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
