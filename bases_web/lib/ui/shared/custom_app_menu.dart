import 'package:bases_web/ui/shared/my_custom_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          MyCustomButton(
            onPress: () => Navigator.pushNamed(context, '/stateful'),
            title: 'Contador Stateful',
            textColor: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          MyCustomButton(
            onPress: () => Navigator.pushNamed(context, '/provider'),
            title: 'Contador Provider',
            textColor: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          MyCustomButton(
            onPress: () {},
            title: 'Otra Pagina',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
