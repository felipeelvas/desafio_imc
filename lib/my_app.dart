// import 'package:desafio_imc/screen/login_page.dart';
// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Desafio IMC',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const LoginPage(),
//       debugShowCheckedModeBanner: false,
//       // routes: {
//       //   // AppRoutes.home: (context) => const MyHomePage(title: 'Desafio IMC'),
//       //   AppRoutes.imc: (context) => const ImcScreen(),
//       // },
//     );
//   }
// }

// @override
// Widget build(BuildContext context, dynamic widget) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       title: Text(widget.title),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text('IMC Calculado:'),
//           const SizedBox(height: 20),
//           Text('', style: Theme.of(context).textTheme.headlineMedium),
//         ],
//       ),
//     ),
//   );
// }

import 'package:desafio_imc/screen/imc_screen.dart';
import 'package:desafio_imc/screen/login_page.dart';
import 'package:desafio_imc/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(),
        '/main': (_) => const MainPage(title: 'Cálculo de IMC'),
        '/imc': (_) => const ImcScreen(),
      },

      //fallback se nenhuma rota for encontrada
      onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => const LoginPage(),
      )
    );
  }
}
