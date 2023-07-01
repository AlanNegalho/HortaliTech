import 'package:app_horta/home/home.dart';
import 'package:app_horta/home/sobre.dart';
import 'package:app_horta/pages/temp_solo/temperatura_solo.dart';
import 'package:app_horta/pages/temperatura_umidade_solo/temperatura_umidade.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primarySwatch: Colors.cyan,
          ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/temperatura_umidade': (context) => const TempHumidade(),
        '/temperatura_solo': (context) => const TemperSolo(),
        '/sobre': (context) => const Sobre(),
      },
    );
  }
}
