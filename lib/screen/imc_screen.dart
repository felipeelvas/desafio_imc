import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import 'package:intl/intl.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultado = '';

  final List<String> _historico = [];

  void _calcularIMC() {
    final peso = double.tryParse(_pesoController.text);
    final altura = double.tryParse(_alturaController.text);

    if (peso == null || altura == null || altura == 0) {
      setState(() {
        _resultado = 'Informe valores válidos';
      });
      return;
    }

    final pessoa = Pessoa(peso: peso, altura: altura);
    final imc = pessoa.calcularIMC();
    final classificacao = pessoa.classificarIMC();
    final dataHora = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    final resultado = 'IMC: ${imc.toStringAsFixed(2)} - $classificacao';

    setState(() {
      _resultado = resultado;
      _historico.insert(0, '[$dataHora] $resultado'); // adiciona no topo
    });
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const Divider(),
            const Text(
              'Histórico de IMC',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _historico.isEmpty
                  ? const Text('Nenhum cálculo realizado ainda.')
                  : ListView.builder(
                      itemCount: _historico.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.history),
                          title: Text(_historico[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
