import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    Timer.periodic(const Duration(seconds: 2), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response =
        await http.get(Uri.parse("http://10.0.0.9:8000/dadoshorta/"));

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
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Temperatura e Umidade",
                )
              ],
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
          : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListTemp(horta: horta),
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
                          "Temperatura: ${horta.first['temperatura']}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Humidade: ${horta.first['humidade']}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class ListTemp extends StatelessWidget {
  const ListTemp({
    super.key,
    required this.horta,
  });

  final List<Map<String, dynamic>> horta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperatura e Umidade"),
      ),
      body: ListView.builder(
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
                    const Divider(),
                    Text(
                      "Temperatura: ${hortas['temperatura']}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Humidade: ${hortas['humidade']}",
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
