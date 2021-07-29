import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _textStyle = new TextStyle(
    fontSize: 30,
  );

  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Número de clicks:',
            style: _textStyle,
          ),
          Text(
            '$_conteo',
            style: _textStyle,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton( child: Icon(Icons.remove), onPressed: _sustraer, ),
        SizedBox( width: 30, ),
        FloatingActionButton( child: Icon(Icons.exposure_zero), onPressed: _reset, ),
        SizedBox( width: 30, ),
        FloatingActionButton( child: Icon(Icons.add), onPressed: _agregar, ),
      ],
    );
  }

  void _agregar() {
    setState(() => _conteo++);
  }

  void _sustraer() {
    setState(() => _conteo--);
  }

  void _reset() {
    setState(() => _conteo = 0);
  }
}
