import 'package:flutter/material.dart';
import 'package:crtech/main.dart';

class TelaAbertura extends StatefulWidget {
  const TelaAbertura({super.key});

  @override
  _TelaAberturaState createState() => _TelaAberturaState();
}

class _TelaAberturaState extends State<TelaAbertura> {
  @override
  void initState() {
    super.initState();
    // Simulando um atraso de carregamento, você pode substituir isso com a lógica real
    Future.delayed(const Duration(seconds: 3), () {
      // Navegue para a próxima tela após o carregamento
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PaginaPrincipal(carrinho: []),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Define a cor de fundo como transparente
      body: Container(
        color: Colors.white, // Cor de fundo do Container
        child: Center(
          child: Image.asset(
            'assets/logo/logo.jpg', // Caminho da imagem
            width: 120.0,
            height: 120.0,
          ),
        ),
      ),
    );
  }
}
