import 'dart:math';

import 'package:flutter/material.dart';

class ListTemp extends StatefulWidget {
  const ListTemp({
    super.key,
    required this.horta,
  });

  final List<Map<String, dynamic>> horta;

  @override
  State<ListTemp> createState() => _ListTempState();
}

Widget grafico = Container();
bool graficoLoaded = false;

// getGrafico() {
//   if (!graficoLoaded) {
//     grafico = GraficoHistorico(horta: widget.horta);
//     graficoLoaded = true;
//   }
//   return grafico;
// }

class _ListTempState extends State<ListTemp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperatura e Umidade"),
        centerTitle: true,
        clipBehavior: Clip
            .antiAliasWithSaveLayer, // Utilizado para evitar o erro de overflow
      ),
      body: ListView.builder(
        itemCount: widget.horta.length,
        itemBuilder: (context, index) {
          final hortas = widget.horta[index];
          return Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 213, 206, 206),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Temperatura: ${hortas['temperatura']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Umidade: ${hortas['umidade']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Data: ${hortas['data']}",
                    )
                  ],
                ),
                const Icon(
                  Icons.thermostat_outlined,
                  size: 60,
                  color: Colors.deepOrange,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
