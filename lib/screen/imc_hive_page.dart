import 'package:desafio_imc/models/imc_hive_model.dart';
import 'package:desafio_imc/repositories/imc_hive_repository.dart';
import 'package:flutter/material.dart';
import '../models/imc.dart';
import 'package:intl/intl.dart';

class ImcHivePage extends StatefulWidget {
  const ImcHivePage({super.key});

  @override
  State<ImcHivePage> createState() => _ImcHivePageState();
}

class _ImcHivePageState extends State<ImcHivePage> {
  late ImcHiveRepository imcRepository;
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultado = '';


  @override
  void initState() {
    super.initState();
    _initRepository();
  }

  Future<void> _initRepository() async {
    imcRepository = ImcHiveRepository();
    setState(() {});
  }

  void _calcularIMC() async {
    final peso = double.tryParse(_pesoController.text);
    final altura = double.tryParse(_alturaController.text);

    if (peso == null || altura == null || altura == 0) {
      setState(() {
        _resultado = 'Por favor, insira valores válidos para peso e altura.';
      });
      return;
    }

    final imc = Imc(peso: peso, altura: altura);
    final imcCalculo = imc.calcularIMC();

    final resultado = 'Seu IMC é ${imcCalculo.toStringAsFixed(2)}\nClassificação: ${imc.classificarIMC()}';

    // Cria objeto para salvar no Hive
    final novoRegistro = ImcHiveModel(
      peso: peso,
      altura: altura,
    );

    await imcRepository.salvar(novoRegistro);

    setState(() {
      _resultado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de IMC'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: MediaQuery.of(context).size.width * 0.06,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              child: FutureBuilder<List<ImcHiveModel>>(

                future: imcRepository.listar(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final historico = snapshot.data!;
                  if (historico.isEmpty) {
                    return const Text('Nenhum cálculo realizado ainda.');
                  }
                  return ListView.builder(
                    itemCount: historico.length,
                    itemBuilder: (context, index) {
                      final item = historico[index];
                      return ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(
                          'Peso: ${item.peso} kg, Altura: ${item.altura} m',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await imcRepository.remover(index);
                            setState(() {}); // recarrega lista
                          },
                        ),
                      );
                    },
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
