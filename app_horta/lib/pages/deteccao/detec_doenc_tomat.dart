// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraDetect extends StatefulWidget {
//   const CameraDetect({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<CameraDetect> createState() => _CameraDetectState();
// }

// class _CameraDetectState extends State<CameraDetect> {
//   final imagePicker = ImagePicker();
//   File? imageFile;
//   String? apiResponse;

//   get http => null;

//   pick(ImageSource source) async {
//     final pickedFile = await imagePicker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//       uploadImage(imageFile!);
//     }
//   }

// import 'dart:convert';

// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'dart:io';

// class CameraDetect extends StatefulWidget {
//   const CameraDetect({super.key, required this.title});

//   final String title;

//   @override
//   State<CameraDetect> createState() => _CameraDetectState();
// }

// class _CameraDetectState extends State<CameraDetect> {
//   final imagePicker = ImagePicker();
//   File? imageFile;
//   String? apiResponse;

//   pick(ImageSource source) async {
//     final pickedFile = await imagePicker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> uploadImage(File image) async {
//     String API_TOKEN = "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";
//     String API_URL =
//         "https://api-inference.huggingface.co/models/surprisedPikachu007/tomato-disease-detection";
//     var request = http.MultipartRequest('POST', Uri.parse(API_URL));
//     request.headers.addAll({'Authorization': 'Bearer $API_TOKEN'});
//     request.files.add(await http.MultipartFile.fromPath('image', image.path));

//     var res = await request.send();
//     res.stream.transform(utf8.decoder).listen((value) {
//       setState(() {
//         apiResponse = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF09CD27),
//         title: const Text("Doenças No Tomateiro",
//             style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.spa_outlined),
//             color: const Color(0xFF000000),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 95,
//                     backgroundColor: Colors.grey[200],
//                     child: CircleAvatar(
//                       radius: 85,
//                       backgroundColor: Colors.grey[300],
//                       backgroundImage:
//                           imageFile != null ? FileImage(imageFile!) : null,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 5,
//                     right: 5,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.grey[200],
//                       child: IconButton(
//                         onPressed: _showOpcoesBottomSheet,
//                         icon: Icon(
//                           PhosphorIcons.regular.pencilSimple,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Text(apiResponse ?? "Nenhuma doença detectada"),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     pick(ImageSource.gallery);
//                   },
//                   child: Text("Escolher imagem"),
//                 ),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }

//   void _showOpcoesBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) {
//         return Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.grey[200],
//                   child: Center(
//                     child: Icon(
//                       PhosphorIcons.regular.image,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                 ),
//                 title: Text(
//                   'Galeria',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   // Buscar imagem da galeria
//                   pick(ImageSource.gallery);
//                 },
//               ),
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.grey[200],
//                   child: Center(
//                     child: Icon(
//                       PhosphorIcons.regular.camera,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                 ),
//                 title: Text(
//                   'Câmera',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   // Fazer foto da câmera
//                   pick(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.grey[200],
//                   child: Center(
//                     child: Icon(
//                       PhosphorIcons.regular.trash,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                 ),
//                 title: Text(
//                   'Remover',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   // Tornar a foto null
//                   setState(() {
//                     imageFile = null;
//                   });
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class CameraDetect extends StatefulWidget {
  const CameraDetect({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CameraDetect> createState() => _CameraDetectState();
}

class _CameraDetectState extends State<CameraDetect> {
  final imagePicker = ImagePicker();
  File? imageFile;
  String? score;
  String? label;

  Future<void> pick(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadImage(File? image) async {
    if (image == null) {
      return;
    }

    String apiToken = "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";
    String apiUrl =
        "https://api-inference.huggingface.co/models/surprisedPikachu007/tomato-disease-detection";

    // Read the image file into bytes
    var bytes = await image.readAsBytes();

    // Create the http request
    var request = http.Request("POST", Uri.parse(apiUrl));
    request.headers['Authorization'] = "Bearer $apiToken";
    request.bodyBytes = bytes; // Set the body bytes to the image bytes

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);

    // Parse the response
    var jsonResponse = jsonDecode(result) as List;

    // Sort the list by 'score' in descending order and take the first element
    jsonResponse.sort((a, b) => (b['score'] as num).compareTo(a['score']));
    var highestScore = jsonResponse.first;

    // Extract 'score' and 'label' into separate variables
    score = highestScore['score'].toString();
    label = highestScore['label'].toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF09CD27),
        title: const Text("Doenças no Tomateiro",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.grey[200],
                    child: CircleAvatar(
                      radius: 140,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          imageFile != null ? FileImage(imageFile!) : null,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        onPressed: _showOpcoesBottomSheet,
                        icon: Icon(
                          PhosphorIcons.regular.pencilSimple,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  label != null ? 'Label: $label' : 'Label indisponível',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  score != null ? 'Score: $score' : 'Score indisponível',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     pick(ImageSource.gallery);
                //   },
                //   child: Text("Escolher imagem"),
                // ),
                const SizedBox(height: 26),
                ElevatedButton(
                  onPressed: () {
                    uploadImage(imageFile);
                  },
                  child: const Text("Analisar Imagem"),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _showOpcoesBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      PhosphorIcons.regular.image,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Galeria',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      PhosphorIcons.regular.camera,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Câmera',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  pick(ImageSource.camera);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      PhosphorIcons.regular.trash,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Remover',
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    imageFile = null;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
