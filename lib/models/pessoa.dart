class Pessoa {
  final double peso;
  final double altura;

  Pessoa({required this.peso, required this.altura});

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC() {
    final imc = calcularIMC();

    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade Grau I';
    if (imc < 39.9) return 'Obesidade Grau II';
    return 'Obesidade Grau III';
  }
}
