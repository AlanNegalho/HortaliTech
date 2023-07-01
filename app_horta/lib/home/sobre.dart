import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sobre"),
                Icon(Icons.flutter_dash),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          Divider(),
          Text("App desenvolvido por:"),
          Text("Alan Negalho"),
          // Text(""),
          // Text(""),
          // Text(""),
        ],
      ),
    );
  }
}
