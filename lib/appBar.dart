import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onCartPressed;
  final ValueChanged<String> onSearchChanged;

  CustomAppBar({
    Key? key,
    required this.onCartPressed,
    required this.onSearchChanged,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink, // Cor de fundo da barra de navegação
      title: TextField(
        onChanged: widget.onSearchChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Pesquisar...',
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none, // Remove a borda da caixa de texto
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white, // Cor da borda focada
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: widget.onCartPressed,
        ),
      ],
    );
  }
}
