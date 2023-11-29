import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image Upload')),
        body: Center(
          child: Container(
            child: TextButton(
              onPressed: () {
                uploadImage('image', File('assets/image.JPG'));
              },
              child: Text('Upload'),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> uploadImage(String title, File file) async {
  String API_TOKEN = "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";
  String API_URL =
      "https://api-inference.huggingface.co/models/surprisedPikachu007/tomato-disease-detection";

  var request = http.MultipartRequest("POST", Uri.parse(API_URL));

  request.headers['Authorization'] = "Bearer $API_TOKEN";

  var picture = http.MultipartFile.fromBytes(
    'image',
    file.readAsBytesSync(),
    filename: 'testimage.png',
  );

  request.files.add(picture);

  var response = await request.send();

  if (response.statusCode == 200) {
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);
  } else {
    print('Erro na solicitação: ${response.reasonPhrase}');
  }
}
