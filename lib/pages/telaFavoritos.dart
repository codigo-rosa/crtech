import 'package:flutter/material.dart';

class TelaDeFavoritos extends StatefulWidget {
  const TelaDeFavoritos({super.key});

  @override
  State<TelaDeFavoritos> createState() => EstadoTelaDeFavoritos();
}

class EstadoTelaDeFavoritos extends State<TelaDeFavoritos> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Favoritos"),
      ),
    );
  }
}
