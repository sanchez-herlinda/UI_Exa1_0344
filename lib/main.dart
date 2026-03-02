import 'package:flutter/material.dart';
import 'package:myapp/mispantallas/Inicio.dart';
import 'package:myapp/mispantallas/pantalla2.dart';
import 'package:myapp/mispantallas/pantalla3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'UI_Exa1_0344',
    initialRoute: '/',
    routes: {
      '/': (context) => Inicio(),
      '/pantalla2': (context) => Pantalla2(),
      '/pantalla3': (context) => Pantalla3(),
    },
  ));
}