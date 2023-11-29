// import 'dart:math';

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double value = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF09CD27),
//           title: const Text('App Horta',
//               style: TextStyle(
//                 color: Colors.black,
//               )),
//           centerTitle: true,
//           leading: IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 setState(() {
//                   _rightClick();
//                   value == 0 ? value = 1 : value = 0;
//                 });
//               }),
//         ),
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             const Text(
//               'Bem vindo ao App Horta',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black),
//             ),
//             Image.asset('assets/app.png', width: 850, height: 450),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/temperatura_umidade');
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Color.fromARGB(255, 3, 158, 225)),
//                         side: MaterialStateProperty.all<BorderSide>(
//                           const BorderSide(
//                               color: Color.fromARGB(255, 8, 6, 6), width: 2.0),
//                         ),
//                       ),
//                       child: const Text(
//                         "Temperatura e Umidade",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/temperatura_solo');
//                       },
//                       style: ButtonStyle(
//                         minimumSize: MaterialStateProperty.all<Size>(
//                             const Size(200, 36)),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.deepOrange),
//                         side: MaterialStateProperty.all<BorderSide>(
//                           const BorderSide(
//                               color: Color(0xFF080606), width: 2.0),
//                         ),
//                       ),
//                       child: const Text(
//                         "Temperatura do Solo",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     // ElevatedButton(
//                     //     onPressed: () {
//                     //       Navigator.pushNamed(context, '/api_temp');
//                     //     },
//                     //     style: ButtonStyle(
//                     //       minimumSize: MaterialStateProperty.all<Size>(
//                     //           const Size(180, 36)),
//                     //       backgroundColor:
//                     //           MaterialStateProperty.all<Color>(Colors.deepOrange),
//                     //       side: MaterialStateProperty.all<BorderSide>(
//                     //         const BorderSide(
//                     //             color: Color(0xFF080606), width: 2.0),
//                     //       ),
//                     //     ),
//                     //     child: const Text(
//                     //       "API - Dados da Temperatura",
//                     //     )),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/detector_doencas');
//                       },
//                       child: const Text('Detectar Doença no Tomate'),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//         drawer: Stack(children: [
//           Stack(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         colors: [Colors.blue.shade400, Colors.blue.shade800],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter)),
//               ),
//               SafeArea(
//                   child: Container(
//                 width: 200.0,
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     const DrawerHeader(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 50.0,
//                             backgroundImage: NetworkImage(
//                                 "https://www.healthshots.com/wp-content/uploads/2020/11/toxic-person-quiz.jpg"),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             "Sharle Shoon",
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                         child: ListView(
//                       children: [
//                         ListTile(
//                           onTap: () {},
//                           leading: const Icon(
//                             Icons.home,
//                             color: Colors.white,
//                           ),
//                           title: const Text(
//                             "Home",
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         ListTile(
//                           onTap: () {},
//                           leading: const Icon(
//                             Icons.person,
//                             color: Colors.white,
//                           ),
//                           title: const Text(
//                             "Profile",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         ListTile(
//                           onTap: () {},
//                           leading: const Icon(
//                             Icons.logout,
//                             color: Colors.white,
//                           ),
//                           title: const Text(
//                             "Logu out",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         )
//                       ],
//                     ))
//                   ],
//                 ),
//               )),
//               _rightClick()
//             ],
//           ),
//         ]));
//   }

//   Widget _rightClick() {
//     return GestureDetector(
//       onHorizontalDragUpdate: (e) {
//         if (e.delta.dx > 0) {
//           setState(() {
//             value = 1;
//           });
//         } else {
//           setState(() {
//             value = 0;
//           });
//         }
//       },
//     );
//   }
// }

// import 'dart:math';

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double value = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.blue.shade400, Colors.blue.shade800],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter)),
//           ),
//           SafeArea(
//               child: Container(
//             width: 200.0,
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const DrawerHeader(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 50.0,
//                         backgroundImage: NetworkImage(
//                             "https://www.healthshots.com/wp-content/uploads/2020/11/toxic-person-quiz.jpg"),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Sharle Shoon",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                     child: ListView(
//                   children: [
//                     ListTile(
//                       onTap: () {},
//                       leading: const Icon(
//                         Icons.home,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         "Home",
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: const Icon(
//                         Icons.person,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         "Profile",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: const Icon(
//                         Icons.logout,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         "Logu out",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ))
//               ],
//             ),
//           )),
//           TweenAnimationBuilder(
//               tween: Tween<double>(begin: 0, end: value),
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.ease,
//               builder: (_, double val, __) {
//                 return (Transform(
//                   alignment: Alignment.center,
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..setEntry(0, 3, 200 * val)
//                     ..rotateY(pi / 6 * val),
//                   child: Scaffold(
//                     appBar: AppBar(
//                       title: const Text("3D Drawer Menu"),
//                       centerTitle: true,
//                       leading: IconButton(
//                           icon: const Icon(Icons.menu),
//                           onPressed: () {
//                             setState(() {
//                               value == 0 ? value = 1 : value = 0;
//                             });
//                           }),
//                     ),
//                     body: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Swipe Right",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           const Text(
//                             "Swipe Left",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ));
//               }),
//           _rightClick()
//         ],
//       ),
//     ]);
//   }

//   Widget _rightClick() {
//     return GestureDetector(
//       onHorizontalDragUpdate: (e) {
//         if (e.delta.dx > 0) {
//           setState(() {
//             value = 1;
//           });
//         } else {
//           setState(() {
//             value = 0;
//           });
//         }
//       },
//     );
//   }
// }

// import 'dart:math';

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.cyan[100],
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF09CD27),
//         title: const Text('App Horta',
//             style: TextStyle(
//               color: Colors.black,
//             )),
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
//       drawer: Drawer(
//         //backgroundColor: Colors.grey[200],
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Container(
//               color: const Color(0xFF09CD27),
//               padding: const EdgeInsets.all(32),
//               child: const Text('Menu'),
//             ),
//             ListTile(
//               title: const Text('Home'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/home');
//               },
//             ),
//             ListTile(
//               title: const Text('Temperatura do Solo'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/temperatura_solo');
//               },
//             ),
//             ListTile(
//               title: const Text('Temperatura e Umidade'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/temperatura_umidade');
//               },
//             ),
//             ListTile(
//               title: const Text('Sobre'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/sobre');
//               },
//             ),
//             Image.asset('assets/app.png', width: 850, height: 450)
//           ],
//         ),
//       ),

//       body: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           const Text(
//             'Bem vindo ao App Horta',
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
//           ),
//           Image.asset('assets/app.png', width: 850, height: 450),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/temperatura_umidade');
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           Color.fromARGB(255, 3, 158, 225)),
//                       side: MaterialStateProperty.all<BorderSide>(
//                         const BorderSide(
//                             color: Color.fromARGB(255, 8, 6, 6), width: 2.0),
//                       ),
//                     ),
//                     child: const Text(
//                       "Temperatura e Umidade",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/temperatura_solo');
//                     },
//                     style: ButtonStyle(
//                       minimumSize:
//                           MaterialStateProperty.all<Size>(const Size(200, 36)),
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.deepOrange),
//                       side: MaterialStateProperty.all<BorderSide>(
//                         const BorderSide(color: Color(0xFF080606), width: 2.0),
//                       ),
//                     ),
//                     child: const Text(
//                       "Temperatura do Solo",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //     onPressed: () {
//                   //       Navigator.pushNamed(context, '/api_temp');
//                   //     },
//                   //     style: ButtonStyle(
//                   //       minimumSize: MaterialStateProperty.all<Size>(
//                   //           const Size(180, 36)),
//                   //       backgroundColor:
//                   //           MaterialStateProperty.all<Color>(Colors.deepOrange),
//                   //       side: MaterialStateProperty.all<BorderSide>(
//                   //         const BorderSide(
//                   //             color: Color(0xFF080606), width: 2.0),
//                   //       ),
//                   //     ),
//                   //     child: const Text(
//                   //       "API - Dados da Temperatura",
//                   //     )),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/detector_doencas');
//                     },
//                     child: const Text('Detectar Doença no Tomate'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double value = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.blue.shade400, Colors.blue.shade800],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter)),
//           ),
//           SafeArea(
//               child: Container(
//             width: 200.0,
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const DrawerHeader(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 50.0,
//                         backgroundImage: NetworkImage(
//                             "https://www.healthshots.com/wp-content/uploads/2020/11/toxic-person-quiz.jpg"),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Sharle Shoon",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                     child: ListView(
//                   children: [
//                     ListTile(
//                       onTap: () {},
//                       leading: const Icon(
//                         Icons.home,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         "Home",
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: const Icon(
//                         Icons.person,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         "Profile",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: const Icon(
//                         Icons.logout,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         "Logu out",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ))
//               ],
//             ),
//           )),
//           TweenAnimationBuilder(
//               tween: Tween<double>(begin: 0, end: value),
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.ease,
//               builder: (_, double val, __) {
//                 return (Transform(
//                   alignment: Alignment.center,
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..setEntry(0, 3, 200 * val)
//                     ..rotateY(pi / 6 * val),
//                   child: FirstScreen(),
//                 ));
//               }),
//           _rightClick()
//         ],
//       ),
//     );
//   }

//   Widget _rightClick() {
//     return GestureDetector(
//       onHorizontalDragUpdate: (e) {
//         if (e.delta.dx > 0) {
//           setState(() {
//             value = 1;
//           });
//         } else {
//           setState(() {
//             value = 0;
//           });
//         }
//       },
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   const FirstScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF09CD27),
//         title: const Text('App Horta',
//             style: TextStyle(
//               color: Colors.black,
//             )),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//         actions: [],
//       ),
//       drawer: Drawer(
//         //backgroundColor: Colors.grey[200],
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Container(
//               color: const Color(0xFF09CD27),
//               padding: const EdgeInsets.all(32),
//               child: const Text('Menu'),
//             ),
//             ListTile(
//               title: const Text('Home'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/home');
//               },
//             ),
//             ListTile(
//               title: const Text('Temperatura do Solo'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/temperatura_solo');
//               },
//             ),
//             ListTile(
//               title: const Text('Temperatura e Umidade'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/temperatura_umidade');
//               },
//             ),
//             ListTile(
//               title: const Text('Sobre'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/sobre');
//               },
//             ),
//             Image.asset('assets/app.png', width: 850, height: 450)
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           const Text(
//             'Bem vindo ao App Horta',
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
//           ),
//           Image.asset('assets/app.png', width: 850, height: 450),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/temperatura_umidade');
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           Color.fromARGB(255, 3, 158, 225)),
//                       side: MaterialStateProperty.all<BorderSide>(
//                         const BorderSide(
//                             color: Color.fromARGB(255, 8, 6, 6), width: 2.0),
//                       ),
//                     ),
//                     child: const Text(
//                       "Temperatura e Umidade",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/temperatura_solo');
//                     },
//                     style: ButtonStyle(
//                       minimumSize:
//                           MaterialStateProperty.all<Size>(const Size(200, 36)),
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.deepOrange),
//                       side: MaterialStateProperty.all<BorderSide>(
//                         const BorderSide(color: Color(0xFF080606), width: 2.0),
//                       ),
//                     ),
//                     child: const Text(
//                       "Temperatura do Solo",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //     onPressed: () {
//                   //       Navigator.pushNamed(context, '/api_temp');
//                   //     },
//                   //     style: ButtonStyle(
//                   //       minimumSize: MaterialStateProperty.all<Size>(
//                   //           const Size(180, 36)),
//                   //       backgroundColor:
//                   //           MaterialStateProperty.all<Color>(Colors.deepOrange),
//                   //       side: MaterialStateProperty.all<BorderSide>(
//                   //         const BorderSide(
//                   //             color: Color(0xFF080606), width: 2.0),
//                   //       ),
//                   //     ),
//                   //     child: const Text(
//                   //       "API - Dados da Temperatura",
//                   //     )),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/detector_doencas');
//                     },
//                     child: const Text('Detectar Doença no Tomate'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:math';

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
                        style: const TextStyle(color: Colors.white),
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
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Bem vindo ao HortaliTech',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Image.asset('assets/app.png', width: 850, height: 450),
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
                          Color.fromARGB(255, 3, 158, 225)),
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
                    child: const Text('Detectar Doença no Tomate'),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
