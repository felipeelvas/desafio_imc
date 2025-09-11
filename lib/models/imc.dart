class Imc {
  final double peso;
  final double altura;

  Imc({required this.peso, required this.altura});

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC() {
    final imcLevel = calcularIMC();

    if (imcLevel < 18.5) return 'Abaixo do peso';
    if (imcLevel < 24.9) return 'Peso normal';
    if (imcLevel < 29.9) return 'Sobrepeso';
    if (imcLevel < 34.9) return 'Obesidade Grau I';
    if (imcLevel < 39.9) return 'Obesidade Grau II';
    return 'Obesidade Grau III';
  }
}
