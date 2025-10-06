import 'package:desafio_imc/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'models/imc_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);

  Hive.registerAdapter(ImcHiveModelAdapter());

  // Abre a box antes de rodar o app
  await Hive.openBox<ImcHiveModel>('imcBox');

  runApp(const MyApp());
}
