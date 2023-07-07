// ignore_for_file: use_build_context_synchronously, dead_code

import 'dart:async';
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
    Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response =
        await http.get(Uri.parse("http://10.8.30.147:8000/umidadesolo/"));

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
        title: const Text("Umidade do Solo"),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            )
          : Column(
              children: [
                Container(
                  height: 250,
                  padding: const EdgeInsets.only(top: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListSoloTemp(horta: horta),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              Text(
                                "Umidade: ${horta.first['umidade']}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(140, 38)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 3, 14, 95)),
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
                                    SnackBar(
                                      content: Text(mensagem),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                        child: const Text(
                          "User Autorização",
                        ))
                  ],
                )
              ],
            ),
    );
  }

  Future<bool> setEstadoBomba(bool value) async {
    String urlGet = "http://10.8.30.147:8000/bombausuario/1/";
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
        String url = "http://10.8.30.147:8000/bombausuario/${id.toString()}/";
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
    String urlGet = "http://10.8.30.147:8000/bombausuario/1/";
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

        String url = "http://10.8.30.147:8000/bombausuario/${id.toString()}/";
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
