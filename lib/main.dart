import 'package:flutter/material.dart';
import 'package:crtech/pagina_principal.dart'; // Importe o seu arquivo de página principal aqui

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
      home: const PaginaPrincipal(
          carrinho: []), // Defina sua página principal aqui
    );
  }
}
