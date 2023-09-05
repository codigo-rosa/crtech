import 'package:flutter/material.dart';

class TelaPIX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento com PIX'),
      ),
      body: Center(
        // Centralize a imagem
        child: Image.asset(
          'assets/qrcode.png', // Substitua pelo caminho da sua imagem PIX
          width: 180,
          height: 70,
        ),
      ),
    );
  }
}
