import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  
  final textStyle = new TextStyle(
    fontSize: 30,
  );

  int conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Número de clicks:', style: textStyle,),
            Text('$conteo', style: textStyle,),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          print('Hola mundo');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}