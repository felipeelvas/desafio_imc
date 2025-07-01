import 'package:desafio_imc/screen/imc_screen.dart';
import 'package:desafio_imc/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Desafio IMC'),
      debugShowCheckedModeBanner: false,
      routes: {
        // AppRoutes.home: (context) => const MyHomePage(title: 'Desafio IMC'),
        AppRoutes.imc: (context) => const ImcScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navegarParaImc() {
    Navigator.of(context).pushNamed(AppRoutes.imc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.calculate),
          label: const Text('Calcular IMC'),
          onPressed: _navegarParaImc,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context, dynamic widget) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('IMC Calculado:'),
          const SizedBox(height: 20),
          Text('', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    ),
  );
}
