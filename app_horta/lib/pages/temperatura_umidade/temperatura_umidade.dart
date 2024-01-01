import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'detalhes_temp_umidade.dart';

class TempHumidade extends StatefulWidget {
  const TempHumidade({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TempHumidadeState createState() => _TempHumidadeState();
}

class _TempHumidadeState extends State<TempHumidade> {
  bool _isLoading = true;
  List<Map<String, dynamic>> horta = [];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      fetchData();
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 60), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      //_isLoading = true;
    });

    final response = await http
        .get(Uri.parse("https://alanoliveira.pythonanywhere.com/dadoshorta/"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _isLoading = false;
        horta = List<Map<String, dynamic>>.from(data);
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
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFF09CD27),
        title: const Text(
          "Temperatura e Umidade",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/temperatura_umidade');
            },
            icon: const Icon(Icons.spa_outlined),
            color: const Color(0xFF000000),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Column(
                    children: [
                      //const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 12.0,
                            animation: false,
                            percent:
                                double.parse(horta.first['temperatura']) / 100,
                            center: Text(
                              "${horta.first['temperatura']} ºC",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            footer: const Text(
                              "Temperatura",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.deepOrange,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.thermostat_outlined,
                                    color: Colors.deepOrange,
                                    size: 30,
                                  ),
                                  Text(
                                    'Temperatura',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "${horta.first['temperatura']} ºC",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.deepOrange,
                                    size: 30,
                                  ),
                                  Text(
                                    'Data/Hora',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "${horta.first['data']} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 12.0,
                            animation: false,
                            percent: double.parse(horta.first['umidade']) / 100,
                            center: Text(
                              "${horta.first['umidade']} %",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            footer: const Text(
                              "Umidade",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: const Color(0xFF22D6FF),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.water_drop_outlined,
                                    color: Color(0xFF22D6FF),
                                    size: 30,
                                  ),
                                  Text(
                                    'Umidade',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "${horta.first['umidade']} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: Color(0xFF22D6FF),
                                    size: 30,
                                  ),
                                  Text(
                                    'Data/Hora',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "${horta.first['data']} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Temperatura",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Sparkline(
                              data: horta
                                  .map((e) => double.parse(e['temperatura']))
                                  .toList()
                                  .sublist(0, min(50, horta.length)),
                              lineWidth: 2.0,
                              lineColor: Colors.red,
                              pointsMode: PointsMode.all,
                              useCubicSmoothing: true,
                              cubicSmoothingFactor: 0.2,
                              pointSize: 5.0,
                              gridLinelabelPrefix: 'ºC ',
                              fallbackHeight: 150.0,
                              fallbackWidth: 300.0,
                              gridLineAmount: 8,
                              enableGridLines: true,
                              kLine: const ['max', 'min', 'first', 'last'],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Umidade",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Sparkline(
                                  data: horta
                                      .map((e) => double.parse(e['umidade']))
                                      .toList()
                                      .sublist(0, min(50, horta.length)),
                                  lineWidth: 2.0,
                                  pointsMode: PointsMode.all,
                                  useCubicSmoothing: true,
                                  cubicSmoothingFactor: 0.2,
                                  pointSize: 5.0,
                                  gridLinelabelPrefix: '%',
                                  fallbackHeight: 150.0,
                                  fallbackWidth: 300.0,
                                  gridLineAmount: 8,
                                  enableGridLines: true,
                                  kLine: const ['max', 'min', 'first', 'last'],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListTemp(horta: horta)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 3, 171, 255),
                          minimumSize: const Size(200, 36),
                          side: const BorderSide(
                              color: Color(0xFF080606), width: 2.0),
                        ),
                        child: const Text(
                          'histórico',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
