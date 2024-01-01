// ignore_for_file: use_build_context_synchronously, dead_code
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:http/http.dart' as http;
import '../bomba/bomba_irrigacao.dart';
import 'package:flutter/material.dart';
import 'detalhes_solo_temp.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:math';

class TemperSolo extends StatefulWidget {
  const TemperSolo({Key? key}) : super(key: key);

  @override
  _TemperSoloState createState() => _TemperSoloState();
}

class _TemperSoloState extends State<TemperSolo> {
  bool _isLoading = true;
  List<Map<String, dynamic>> horta = [];

  String mensagem = "";

  String getMensagemUmidade(int valor) {
    if (valor < 60) {
      return "Solo Seco";
    } else if (valor >= 60 && valor <= 75) {
      return "Solo Úmido";
    } else if (valor > 75) {
      return "Solo Molhado";
    }
    // Caso o valor não esteja em nenhuma das faixas acima, retorne uma mensagem de erro ou um valor padrão.
    return "Valor inválido";
  }

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
        .get(Uri.parse("https://alanoliveira.pythonanywhere.com/umidadesolo/"));

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
    bool click = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF09CD27),
        title: const Text("Umidade do Solo",
            style: TextStyle(color: Colors.black)),
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
      body: _isLoading
          ? Container(
              decoration: const BoxDecoration(),
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                    backgroundColor: Color.fromARGB(26, 61, 49, 49),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    //color: Color.fromARGB(255, 150, 152, 150),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 12.0,
                            animation: false,
                            percent: double.parse(horta.first['umidade']) / 100,
                            center: Text(
                              "${horta.first['umidade']} %",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            progressColor: Colors.deepOrange,
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
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "  Umidade  ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '   ${getMensagemUmidade(int.parse(horta.first['umidade']))}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                        // margin: const EdgeInsets.only(left: 4.0, right: 6.0),
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
                        child: Container(
                          margin: const EdgeInsets.only(left: 8.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Sparkline(
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
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 91, 194, 7),
                          minimumSize: const Size(150, 36),
                          side: const BorderSide(
                              color: Color(0xFF080606), width: 2.0),
                        ),
                        onPressed: click
                            ? () {}
                            : () async {
                                setState(() {
                                  click = true;
                                });
                                bool result = await setEstadoBomba(true);
                                setState(() {
                                  click = false;
                                });
                                if (result) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Bomba Ligada"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Erro ao ligar a bomba"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                        child: const Text(
                          "Ligar Bomba",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 203, 5, 5),
                        minimumSize: const Size(150, 36),
                        side: const BorderSide(
                            color: Color(0xFF080606), width: 2.0),
                      ),
                      onPressed: click
                          ? () {}
                          : () async {
                              setState(() {
                                click = false;
                              });
                              bool result = await setEstadoBomba(false);
                              setState(() {
                                click = false;
                              });
                              if (result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Bomba Desligada"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Erro ao desligar a bomba"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                      child: const Text(
                        "Desligar Bomba",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                    height: 40,
                    child: Text(
                      "Autorizar Usuário",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "OFF",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RollingSwitch.icon(
                      onChanged: click
                          ? (bool state) {}
                          : (bool state) async {
                              setState(() {
                                click = true;
                              });
                              bool result = await setEstadoUser();
                              setState(() {
                                click = false;
                              });
                              if (result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(getMensagem()),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Erro ao ativar a horta"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "ON",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListSoloTemp(horta: horta),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 171, 255),
                    minimumSize: const Size(200, 36),
                    side:
                        const BorderSide(color: Color(0xFF080606), width: 2.0),
                  ),
                  child: const Text(
                    "Histórico",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
    );
  }
}
