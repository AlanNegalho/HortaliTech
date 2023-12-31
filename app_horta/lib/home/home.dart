import 'dart:math';

import 'package:app_horta/pages/temp_api/api_temp.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double value = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 48, 45, 45),
              Colors.blueAccent
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          SafeArea(
              child: Container(
            width: 200.0,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/app.png')),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "HORTALITECH",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      leading: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: const Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/sobre');
                      },
                      leading: const Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: const Text(
                        "Sobre",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: const Text(
                        "Logu out",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY(pi / 6 * val),
                  child: FirstScreen(
                    alternarValue: alternarValue,
                  ),
                ));
              }),
          _rightClick()
        ],
      ),
    );
  }

  void alternarValue() {
    setState(() {
      value == 0 ? value = 1 : value = 0;
    });
  }

  Widget _rightClick() {
    return GestureDetector(
      onHorizontalDragUpdate: (e) {
        if (e.delta.dx > 0) {
          setState(() {
            value = 1;
          });
        } else {
          setState(() {
            value = 0;
          });
        }
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  final Function alternarValue;
  const FirstScreen({Key? key, required this.alternarValue}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF09CD27),
          title: const Text('HortaliTech',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          // aqui vai um botão para setar o value para 1
          leading: IconButton(
            onPressed: () {
              widget.alternarValue();
            },
            icon: const Icon(Icons.menu),
            color: const Color(0xFF000000),
          )),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/api_temp');
                },
                icon: const Icon(Icons.filter_drama_sharp,
                    size: 50,
                    color: Colors.blueAccent,
                    semanticLabel: 'Text to announce in accessibility modes'),
              ),
            ],
          ),
          const Text(
            'Bem vindo ao HortaliTech',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Image.asset('assets/app.png', width: 850, height: 320),
          const Text('HORTALITECH',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/temperatura_umidade');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 3, 158, 225)),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                            color: Color.fromARGB(
                                255, 8, 6, 6), //Color(0xFF080606)
                            width: 2.0),
                      ),
                    ),
                    child: const Text(
                      "Temperatura e Umidade",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/temperatura_solo');
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(200, 36)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Color(0xFF080606), width: 2.0),
                      ),
                    ),
                    child: const Text(
                      "Umidade do Solo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detector_doencas');
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(200, 36)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 149, 149, 149)),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    child: const Text(
                      'Doença no Tomateiro',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
