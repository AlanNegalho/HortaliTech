import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF09CD27),
          title: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text("Sobre  "),
                  Icon(Icons.spa_outlined),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Colors.teal,
                Colors.indigo,
                Colors.yellow,
                Colors.purple,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HortaliTech",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 187, 188, 187),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Text(
                  "Este aplicativo foi desenvolvido para auxiliar o produtor rural visualizar informações sobre as culturas cultivadas e controle de inrrigação, auxiliando  na tomada de decisão, com base em dados coletados por sensores instalados na Plantação.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          //transform: Matrix4.rotationZ(0.05),
        ));
  }
}
