import 'package:desafio_imc/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../shared/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainpageState();
}

class _MainpageState extends State<MainPage> {
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
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular IMC'),
              onPressed: () {
                _navegarParaImc;
              },
              // onPressed: ,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
