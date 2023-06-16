import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TemperSolo extends StatefulWidget {
  const TemperSolo({super.key});

  @override
  _TemperSoloState createState() => _TemperSoloState();
}

class _TemperSoloState extends State<TemperSolo> {
  bool _isLoading = true;
  List<Map<String, dynamic>> horta = [];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response =
        await http.get(Uri.parse("http://10.8.30.139:8000/UmidadeSolo/"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _isLoading = false;
        horta = List<Map<String, dynamic>>.from(data.reversed);
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            )
          : ListView.builder(
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
                            "Humidade: ${hortas['Umidade']}",
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
