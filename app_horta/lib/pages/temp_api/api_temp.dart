import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class ApiTemp extends StatefulWidget {
  const ApiTemp({Key? key}) : super(key: key);

  @override
  State<ApiTemp> createState() => _ApiTempState();
}

class _ApiTempState extends State<ApiTemp> {
  final String _appId = 'Sua chave de API';
  String _temperature = '';
  String _humidity = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _getTemp(); // Chama a função ao iniciar a tela
    _timer = Timer.periodic(const Duration(minutes: 10), (Timer t) {
      _getTemp(); // Chama a função a cada 10 minutos
    });
  }

  Future<void> _getTemp() async {
    // Use a variável para a chave appid ao construir a URL
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=corrente&appid=$_appId&units=metric&lang=pt_br');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _temperature = data['main']['temp'].toString();
        _humidity = data['main']['humidity'].toString();
      });
    }
  }

  @override
  void dispose() {
    _timer
        .cancel(); // Cancela o timer ao sair da tela para evitar vazamentos de memória
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFF09CD27),
        title: const Text(
          'Clima',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('assets/app.png', width: 850, height: 220),
          const Text('HORTALITECH',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
          const SizedBox(
            height: 40,
          ),
          const Text('Temperatura e Umidade em Corrente-PI',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black)),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            color: const Color.fromARGB(255, 233, 233, 228),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 12.0,
                      animation: false,
                      percent: double.parse(_temperature) / 100,
                      center: Text(
                        '$_temperature ºC',
                        style: const TextStyle(fontSize: 15),
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
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            '$_temperature ºC',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 12.0,
                      animation: false,
                      percent: double.parse(_humidity) / 100,
                      center: Text(
                        '$_humidity %',
                        style: const TextStyle(fontSize: 15),
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
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            "$_humidity %",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}









// class ApiTemp extends StatefulWidget {
//   const ApiTemp({Key? key}) : super(key: key);

//   @override
//   State<ApiTemp> createState() => _ApiTempState();
// }

// class _ApiTempState extends State<ApiTemp> {
//   bool _isLoading = true;
//   List<Map<String, dynamic>> temperatura = [];

//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _getTemp(); // Chama a função ao iniciar a tela
//     _timer = Timer.periodic(const Duration(minutes: 10), (Timer t) {
//       _getTemp(); // Chama a função a cada 10 minutos
//     });
//   }

//   Future<void> _getTemp() async {
//     final response = await http.get(Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?q=corrente&appid=d8dfd3c0cfb76c415edc146e46f3586b&units=metric&lang=pt_br'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         _isLoading = false;
//         temperatura = List<Map<String, dynamic>>.from(data);
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//     }

//     // if (response.statusCode == 200) {
//     //   final data = jsonDecode(response.body);
//     //   setState(() {
//     //     _temperature = data['main']['temp'].toString();
//     //     _humidity = data['main']['humidity'].toString();
//     //   });
//     // }
//   }

//   @override
//   void dispose() {
//     _timer
//         .cancel(); // Cancela o timer ao sair da tela para evitar vazamentos de memória
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('API'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Text(
//                   'Temperatura: ${temperatura[0]['main']['temp']}'.toString(),
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 // Text(
//                 //   'Temperatura: $_temperature',
//                 //   style: const TextStyle(fontSize: 20),
//                 // ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             // Text(
//             //   //'Umidade: $_humidity',
//             //   //style: const TextStyle(fontSize: 20),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }








// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ApiTemp extends StatefulWidget {
//   const ApiTemp({Key? key}) : super(key: key);

//   @override
//   State<ApiTemp> createState() => _ApiTempState();
// }

// class _ApiTempState extends State<ApiTemp> {
//   String _temperature = '';
//   String _humidity = '';

//   Future<void> _getTemp() async {
//     final response = await http.get(Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?q=corrente&appid=d8dfd3c0cfb76c415edc146e46f3586b'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _temperature = data['main']['temp'].toString();
//         _humidity = data['main']['humidity'].toString();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('API'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _getTemp();
//               },
//               child: const Text('Carregar temperatura'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Temperatura: $_temperature',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Umidade: $_humidity',
//               style: const TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
