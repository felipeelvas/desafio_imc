
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget{

  static const String routeName = '/password';

  const PasswordPage({super.key});

  @override
  State createState() => _PasswordPageInsideState();

}

class _PasswordPageInsideState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atualizar Senha'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Theme.of(context).colorScheme.onSecondary,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.chevron_left,
              size: MediaQuery.of(context).size.width * 0.06,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('This is the Password Page'),
          ],
        ),
      ),
    );
  }
}