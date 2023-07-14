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

class _ListTempState extends State<ListTemp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFF09CD27),
        title: const Text(
          "Temperatura e Umidade",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.spa_outlined),
            color: const Color(0xFF000000),
          ),
        ],
        centerTitle: true,
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
              color: const Color(0xFFEBE7E7),
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
                    const Divider(),
                    Text(
                      "Data: ${hortas['data']}",
                    )
                  ],
                ),
                const Icon(
                  Icons.wb_sunny_rounded,
                  size: 40,
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
