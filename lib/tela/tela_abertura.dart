import 'package:crtech/pagina_principal.dart';
import 'package:flutter/material.dart';
import 'package:crtech/main.dart';

class TelaAbertura extends StatefulWidget {
  const TelaAbertura({super.key});

  @override
  TelaAberturaState createState() => TelaAberturaState();
}

class TelaAberturaState extends State<TelaAbertura> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Aguarda um atraso de 3 segundos utilizando o `Future.delayed`
      Navigator.pushReplacement(
        // Utiliza o `Navigator.pushReplacement` para substituir esta tela.
        context,
        MaterialPageRoute(
          builder: (context) => const PaginaPrincipal(carrinho: []),
        ),
      );
    });
  }

  @override // Exibe a imagem do logotipo com as dimensões definidas
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/logo/logo.jpg',
            width: 120.0,
            height: 120.0,
          ),
        ),
      ),
    );
  }
}
