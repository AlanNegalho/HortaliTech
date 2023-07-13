// ignore_for_file: use_build_context_synchronously, dead_code

import 'dart:async';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detalhes_solo_temp.dart';

class TemperSolo extends StatefulWidget {
  const TemperSolo({super.key});

  @override
  _TemperSoloState createState() => _TemperSoloState();
}

class _TemperSoloState extends State<TemperSolo> {
  bool _isLoading = true;
  List<Map<String, dynamic>> horta = [];

  String mensagem = "";

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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            "Umidade: ${horta.first['umidade']}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text("data/Hora"),
                              Text((horta.first['data']),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        margin: const EdgeInsets.only(left: 8.0, right: 10.0),
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
                        child: Sparkline(
                          data: horta
                              .map((e) => double.parse(e['umidade']))
                              .toList(),
                          lineWidth: 2.0,
                          useCubicSmoothing: true,
                          cubicSmoothingFactor: 0.2,
                          pointSize: 5.0,
                          gridLinelabelPrefix: '%',
                          fallbackHeight: 200.0,
                          fallbackWidth: 300.0,
                          gridLineAmount: 5,
                          enableGridLines: true,
                          kLine: const ['max', 'min', 'first', 'last'],
                          max: 2.0,
                          min: -1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(140, 38)),
                            side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black),
                            ),
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
                          child: const Text("Ligar Bomba")),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(140, 38)),
                        side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.black),
                        ),
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
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                                    content: Text(mensagem),
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
                    )
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
                  child: const Text("Histórico"),
                ),
              ],
            ),
    );
  }

  Future<bool> setEstadoBomba(bool value) async {
    String urlGet = "https://alanoliveira.pythonanywhere.com/bombausuario/1/";
    int id = 0;
    bool userAuth = false;

    try {
      var responseGet = await http.get(Uri.parse(urlGet));
      print(responseGet.statusCode);

      if (responseGet.statusCode == 200) {
        final data = json.decode(responseGet.body);
        print(data);
        id = data['id'];
        userAuth = data['user'];
      }

      if (id == 1 && userAuth == true) {
        String url =
            "https://alanoliveira.pythonanywhere.com/bombausuario/${id.toString()}/";
        var response =
            await http.patch(Uri.parse(url), body: {"bomba": value.toString()});

        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setEstadoUser() async {
    String urlGet = "https://alanoliveira.pythonanywhere.com/bombausuario/1/";
    int id = 0;
    bool userAuth = false;
    bool value = true;

    try {
      var responseGet = await http.get(Uri.parse(urlGet));

      if (responseGet.statusCode == 200) {
        final data = json.decode(responseGet.body);
        id = data['id'];
        userAuth = data['user'];
      }

      if (id == 1) {
        if (userAuth == true) {
          value = false;
        } else {
          value = true;
        }

        String url =
            "https://alanoliveira.pythonanywhere.com/bombausuario/${id.toString()}/";
        var response =
            await http.put(Uri.parse(url), body: {"user": value.toString()});

        if (response.statusCode == 200) {
          mensagem = value ? "User Autorizado" : "User Não Autorizado";
          return true;
        } else {
          mensagem = "Erro ao mudar o estado do user";
          return false;
        }
      }
      mensagem = "Erro ao mudar o estado do user";
      return false;
    } catch (e) {
      mensagem = "Erro ao mudar o estado do user";
      return false;
    }
  }
}
