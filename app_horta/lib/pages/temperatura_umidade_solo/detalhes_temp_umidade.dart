import 'package:flutter/material.dart';

class ListTemp extends StatelessWidget {
  const ListTemp({
    super.key,
    required this.horta,
  });

  final List<Map<String, dynamic>> horta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperatura e Umidade"),
      ),
      body: Container(
        height: 300,
        color: const Color(0xFFEFEAEA),
        child: ListView.builder(
          itemCount: horta.length,
          itemBuilder: (context, index) {
            final hortas = horta[index];
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
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
            );
          },
        ),
      ),
    );
  }
}
