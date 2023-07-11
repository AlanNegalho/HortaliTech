import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:provider/provider.dart';

import 'detalhes_temp_umidade.dart';

class TempHumidade extends StatefulWidget {
  const TempHumidade({super.key});

  @override
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
    Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      //_isLoading = true;
    });

    final response =
        await http.get(Uri.parse("http://10.8.30.147:8000/dadoshorta/"));

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
                          const Icon(
                            Icons.thermostat_outlined,
                            size: 80,
                            color: Colors.deepOrange,
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
                          const Icon(
                            Icons.water_drop_outlined,
                            color: Color(0xFF22D6FF),
                            size: 80,
                          ),
                        ],
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
                            Sparkline(
                              data: horta
                                  .map((e) => double.parse(e['temperatura']))
                                  .toList(),

                              lineWidth: 2.0,
                              lineColor: Colors.red,

                              //lineColor: Colors.deepOrange,
                              //fillColor: Colors.deepOrange.withOpacity(0.5),
                              pointSize: 5.0,

                              gridLinelabelPrefix: 'ºC',
                              fallbackHeight: 100.0,
                              fallbackWidth: 300.0,

                              gridLineAmount: 5,

                              enableGridLines: true,
                              //averageLine: true,
                              //averageLabel: true,

                              kLine: const ['max', 'min', 'first', 'last'],
                              max: 100.0,
                              min: 5.0,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Umidade",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                Sparkline(
                                  data: horta
                                      .map((e) => double.parse(e['umidade']))
                                      .toList(),

                                  lineWidth: 2.0,

                                  //backgroundColor: Colors.red,
                                  //lineColor: Colors.lightGreen[500]!,
                                  //fillMode: FillMode.none,
                                  //fillColor: Colors.lightGreen[200]!,
                                  useCubicSmoothing: true,
                                  cubicSmoothingFactor: 0.2,
                                  pointSize: 5.0,

                                  gridLinelabelPrefix: '%',
                                  fallbackHeight: 100.0,
                                  fallbackWidth: 300.0,

                                  gridLineAmount: 5,

                                  enableGridLines: true,
                                  //averageLine: true,
                                  //averageLabel: true,

                                  kLine: const ['max', 'min', 'first', 'last'],
                                  max: 100.0,
                                  min: 26.0,

                                  //enableThreshold: true,
                                  // lineGradient: LinearGradient(
                                  //   begin: Alignment.topCenter,
                                  //   end: Alignment.bottomCenter,
                                  //   colors: [
                                  //     Colors.purple[800]!,
                                  //     Colors.purple[200]!
                                  //   ],
                                  // ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                  child: const Text('histórico'),
                )
              ],
            ),
    );
  }
}
