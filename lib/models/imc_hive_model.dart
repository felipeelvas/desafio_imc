import 'package:hive/hive.dart';
part 'imc_hive_model.g.dart';

@HiveType(typeId: 0)
class ImcHiveModel extends HiveObject {
  @HiveField(0)
  double peso = 0.0;

  @HiveField(1)
  double altura = 0.0;

  ImcHiveModel({this.peso = 0.0, this.altura = 0.0});

  ImcHiveModel.criar(this.peso, this.altura);

  double calcularIMC() {
    if (altura == 0) return 0.0;
    return peso / (altura * altura);
  }

  String classificarIMC() {
    final imc = calcularIMC();
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc < 24.9) {
      return 'Peso normal';
    } else if (imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc < 34.9) {
      return 'Obesidade grau I';
    } else if (imc < 39.9) {
      return 'Obesidade grau II';
    } else {
      return 'Obesidade grau III';
    }
  }
}