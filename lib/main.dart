import 'package:crtech/tela/tela_abertura.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CR Tech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: TelaAbertura() // Defina sua página principal aqui
        );
  }
}
