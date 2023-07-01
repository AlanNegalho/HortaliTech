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
        backgroundColor: Colors.deepOrange,
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Umidade do Solo"), Text("       ")],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: horta.length,
        itemBuilder: (context, index) {
          final hortas = horta[index];
          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Humidade: ${hortas['umidade']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
