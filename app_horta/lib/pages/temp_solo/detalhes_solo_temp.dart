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
        backgroundColor: const Color(0xFF09CD27),
        title: const Text(
          "Umidade do Solo",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.spa_outlined),
            color: const Color(0xFF000000),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: horta.length,
        itemBuilder: (context, index) {
          final hortas = horta[index];
          return Container(
            height: 50,
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xFFEBE7E7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Umidade: ${hortas['umidade']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Data: ${hortas['data']}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Icon(
                  Icons.spa_outlined,
                  color: Color.fromARGB(255, 229, 126, 82),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
