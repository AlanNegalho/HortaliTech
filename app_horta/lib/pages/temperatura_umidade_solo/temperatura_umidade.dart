import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

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
    Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response =
        await http.get(Uri.parse("http://10.8.30.147:8000/dadoshorta/"));

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
        backgroundColor: const Color(0xFF09CD27),
        title: Text(
          "Temperatura e Umidade",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/temperatura_umidade');
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListTemp(horta: horta),
                  ),
                );
              },
              child: Container(
                height: 300,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    //const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 12.0,
                          animation: false,
                          percent:
                              double.parse(horta.first['temperatura']) / 100,
                          center: Text(
                            "${horta.first['temperatura']}ºC",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
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
                          size: 90,
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
                          radius: 100.0,
                          lineWidth: 12.0,
                          animation: false,
                          percent: double.parse(horta.first['umidade']) / 100,
                          center: Text(
                            "${horta.first['umidade']}ºC",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
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
                          size: 90,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}



// segue abaixo um codigo para o usuario poder escolher o periodo de tempo que ele quer ver os dados da temperatura e umidade



// segue abaixo um codigo para exibir os dados da temperatura e umidade em formato de grafico de linha ultilizando a biblioteca charts_flutter

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TempHumidade extends StatefulWidget {
//   const TempHumidade({super.key});

//   @override
//   _TempHumidadeState createState() => _TempHumidadeState();
// }

// class _TempHumidadeState extends State<TempHumidade> {
//   List<Map<String, dynamic>> horta = [];

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     Timer.periodic(const Duration(seconds: 2), (timer) {
//       fetchData();
//     });
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse("http://192.168.1.34:8000/dadoshorta/"));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         horta = List<Map<String, dynamic>>.from(data.reversed);
//       });
//     } else {
//       throw Exception('Falha ao carregar os dados');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Temperatura e Umidade"),
//                 Icon(Icons.flutter_dash),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: horta.length,
//         itemBuilder: (context, index) {
//           final hortas = horta[index];
//           return Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Divider(),
//                   Text("Temperatura: ${hortas['temperatura']}"),
//                   Text("Humidade: ${hortas['humidade']}"),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TempHumidade extends StatefulWidget {
//   const TempHumidade({super.key});

//   @override
//   _TempHumidadeState createState() => _TempHumidadeState();
// }

// class _TempHumidadeState extends State<TempHumidade> {
//   List<Map<String, dynamic>> horta = [];
//   bool _progressBarActive = false;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     Timer.periodic(const Duration(seconds: 2), (timer) {
//       fetchData();
//     });
//   }

//   Future<void> fetchData() async {
//     if (!_progressBarActive) {
//       setState(() {
//         _progressBarActive = true;
//       });
//     }

//     final response =
//         await http.get(Uri.parse("http://192.168.1.34:8000/dadoshorta/"));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         horta = List<Map<String, dynamic>>.from(data.reversed);
//         _progressBarActive = false;
//       });
//     } else {
//       throw Exception('Falha ao carregar os dados: ${response.body}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Temperatura e Umidade"),
//                 Icon(Icons.flutter_dash),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: _progressBarActive
//           ? Center(child: const CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: horta.length,
//               itemBuilder: (context, index) {
//                 final hortas = horta[index];
//                 return Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Divider(),
//                         Text("Temperatura: ${hortas['temperatura']}"),
//                         Text("Humidade: ${hortas['humidade']}"),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             ),
//     );
//   }
// }
