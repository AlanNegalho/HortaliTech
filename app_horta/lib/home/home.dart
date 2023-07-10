import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF09CD27),
        title: const Text('App Horta',
            style: TextStyle(
              color: Colors.black,
            )),
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
      drawer: Drawer(
        //backgroundColor: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: const Color(0xFF09CD27),
              padding: const EdgeInsets.all(32),
              child: const Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: const Text('Temperatura do Solo'),
              onTap: () {
                Navigator.pushNamed(context, '/temperatura_solo');
              },
            ),
            ListTile(
              title: const Text('Temperatura e Umidade'),
              onTap: () {
                Navigator.pushNamed(context, '/temperatura_umidade');
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pushNamed(context, '/sobre');
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Bem vindo ao App Horta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset('assets/farm.png', width: 700, height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset('assets/images/splash.png', width: 3),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/temperatura_umidade');
                      },
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(
                                  color: Color.fromARGB(255, 8, 6, 6),
                                  width: 2.0))),
                      child: const Text("Temperatura e Umidade")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/temperatura_solo');
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(180, 36)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepOrange),
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                              color: Color(0xFF080606), width: 2.0),
                        ),
                      ),
                      child: const Text(
                        "Temperatura do Solo",
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
