// import 'package:flutter/material.dart';
// import 'dart:async';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RealTimeClock(),
//     );
//   }
// }

// class RealTimeClock extends StatefulWidget {
//   @override
//   _RealTimeClockState createState() => _RealTimeClockState();
// }

// class _RealTimeClockState extends State<RealTimeClock> {
//   String currentTime = '';
//   String currentDate = '';

//   @override
//   void initState() {
//     super.initState();
//     startClock();
//   }

//   void startClock() {
//     const oneSecond = Duration(seconds: 1);
//     Timer.periodic(oneSecond, (timer) {
//       setState(() {
//         currentTime = _getCurrentTime();
//         currentDate = _getCurrentDate();
//       });
//     });
//   }

//   String _getCurrentTime() {
//     final now = DateTime.now();
//     final formattedTime = "${now.hour}:${now.minute}:${now.second}";
//     return formattedTime;
//   }

//   String _getCurrentDate() {
//     final now = DateTime.now();
//     final formattedDate = "${now.day}/${now.month}/${now.year}";
//     return formattedDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Relógio em Tempo Real'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Data atual em tempo real:',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               currentDate,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Hora atual em tempo real:',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               currentTime,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:app_horta/pages/controller/home_controller.dart';
import 'package:app_horta/pages/temperatura_umidade/temperatura_umidade.dart';
import 'package:app_horta/pages/temp_solo/temperatura_solo.dart';
import 'package:app_horta/pages/temp_api/api_temp.dart';
import 'package:app_horta/pages/deteccao/detec_doenc_tomat.dart';
import 'package:app_horta/home/sobre.dart';
import 'package:app_horta/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            //primarySwatch: Colors.cyan,
            ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),

          '/temperatura_umidade': (context) => const TempHumidade(),
          '/temperatura_solo': (context) => const TemperSolo(),
          '/sobre': (context) => const Sobre(),
          '/detector_doencas': (context) => const CameraDetect(
                title: '',
              )
          // '/api_temp': (context) => const ApiTemp(),
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TomatoDiseaseDetectionPage(),
//     );
//   }
// }

// class TomatoDiseaseDetectionPage extends StatefulWidget {
//   @override
//   _TomatoDiseaseDetectionPageState createState() =>
//       _TomatoDiseaseDetectionPageState();
// }

// class _TomatoDiseaseDetectionPageState
//     extends State<TomatoDiseaseDetectionPage> {
//   // URL da API e token de autenticação
//   final String apiURL =
//       "https://api-inference.huggingface.co/models/surprisedPikachu007/tomato-disease-detection";
//   final String apiToken = "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";

//   // Função para enviar a imagem para a API
//   Future<void> sendImageToAPI(String filePath) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(apiURL));
//       request.headers['Authorization'] = 'Bearer $apiToken';
//       request.files.add(await http.MultipartFile.fromPath('file', filePath));

//       var response = await request.send();
//       var responseString = await response.stream.bytesToString();
//       print(responseString);
//     } catch (e) {
//       print("Ocorreu um erro: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detecção de Doenças em Tomates"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Abra um seletor de arquivo para o usuário escolher uma imagem
//                 // e, em seguida, chame sendImageToAPI com o caminho do arquivo selecionado.
//               },
//               child: Text("Selecionar Imagem"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// void main() {
//   uploadAndQuery();
// }

// Future<void> uploadAndQuery() async {
//   String API_TOKEN = "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";
//   String API_URL =
//       "https://api-inference.huggingface.co/models/surprisedPikachu007/tomato-disease-detection";

//   var file = File('assets/image.JPG');

//   try {
//     var bytes = await file.readAsBytes();

//     var request = http.Request("POST", Uri.parse(API_URL));
//     request.headers['Authorization'] = "Bearer $API_TOKEN";
//     request.bodyBytes = bytes;

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       var responseData = await response.stream.toBytes();
//       var result = String.fromCharCodes(responseData);
//       print(result);
//     } else {
//       print('Erro na solicitação: ${response.reasonPhrase}');
//     }
//   } on FileSystemException {
//     print("Arquivo não encontrado.");
//   } catch (e) {
//     print("Ocorreu um erro: $e");
//   }
// }
