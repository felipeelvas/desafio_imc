import 'package:desafio_imc/screen/imc_screen.dart';
import 'package:flutter/material.dart';

import '../shared/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainpageState();
}

class _MainpageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Card(
              color: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(20),
              elevation: 5,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('Desafio IMC!',
                style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.calculate, size: 32,),
                  onPressed: () {
                    Navigator.push(
                      context,
                    MaterialPageRoute(builder: (BuildContext context) => const ImcScreen())
                    );
                  },
                  label:  Text('Calcular IMC'),
                  style: ElevatedButton.styleFrom(
                    padding:  EdgeInsets.all(24),
                    textStyle:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    elevation: 5,
                    shadowColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
