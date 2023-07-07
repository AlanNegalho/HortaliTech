import 'package:flutter/material.dart';

class ListSoloTemp extends StatelessWidget {
  const ListSoloTemp({
    super.key,
    required this.horta,
  });

  final List<Map<String, dynamic>> horta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Umidade do Solo"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: horta.length,
        itemBuilder: (context, index) {
          final hortas = horta[index];
          return Container(
            width: 100,
            height: 50,
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 213, 206, 206),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Humidade: ${hortas['umidade']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Data: ${hortas['data']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
