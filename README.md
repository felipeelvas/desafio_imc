# 📱 Desafio IMC

Aplicativo Flutter para **cálculo do IMC (Índice de Massa Corporal)** com histórico de medições e fluxo básico de login.  
Este projeto foi desenvolvido como parte de um **desafio de estudos em Flutter/Dart**.

---

## ✨ Funcionalidades

- 🔑 Tela de **Login** e fluxo de **Esqueci minha senha**
- 🏠 Tela principal (**MainPage**) com destaque do desafio
- 📊 Cálculo do **IMC** a partir de peso (kg) e altura (m)
- 🧮 Exibição da **classificação do IMC** (abaixo do peso, normal, sobrepeso, obesidade, etc.)
- 📜 **Histórico de cálculos** armazenado na sessão (com data)
- 🧭 Navegação com **rotas nomeadas** (`/`, `/main`, `/imc`)
- 🎨 Interface com **Material Design** + **Google Fonts**

---

## 📸 Screenshots (exemplo)

| Login | Main | IMC |
|-------|------|-----|
| ![Login](docs/login.png) | ![Main](docs/main.png) | ![IMC](docs/imc.png) |

*(adicione imagens em `/docs` ou use prints do app rodando)*

---

## 🛠️ Tecnologias

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [intl](https://pub.dev/packages/intl) — formatação de datas
- [google_fonts](https://pub.dev/packages/google_fonts) — tipografia personalizada


---

## 🚀 Como executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/felipeelvas/desafio_imc.git
   cd desafio_imc
2. Instale as dependências:
   ```bash
   flutter pub get
3. Execute o app:
   ```bash
   flutter run
---

## 📈 Próximos passos (roadmap)

 - Persistir histórico em armazenamento local (shared_preferences ou hive)

 - Validação de inputs com TextFormField e mensagens de erro

 - Testes unitários para a lógica de cálculo do IMC

 - Melhorias de UX (máscaras numéricas, feedback visual, animações)

 - Dark mode 🌙

