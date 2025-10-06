import 'package:hive/hive.dart';
import '../models/imc_hive_model.dart';

class ImcHiveRepository {
  final Box<ImcHiveModel> _box = Hive.box<ImcHiveModel>('imcBox');

  // Adicionar um registro
  Future<void> salvar(ImcHiveModel imc) async {
    await _box.add(imc);
  }

  // Buscar todos os registros
  List<ImcHiveModel> obterDados() {
    return _box.values.toList();
  }

  // Deletar por índice
  Future<void> remover(int index) async {
    await _box.deleteAt(index);
  }

  Future<List<ImcHiveModel>> listar() async {
    return _box.values.toList();
  }
}
