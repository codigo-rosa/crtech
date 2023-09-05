import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onCartPressed;
  final ValueChanged<String> onSearchChanged;

  CustomAppBar({
    Key? key,
    required this.onCartPressed,
    required this.onSearchChanged,
  })  : preferredSize = const Size.fromHeight(50.0), // Altura da AppBar
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearchExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Cor de fundo da barra de navegação
      title: _isSearchExpanded
          ? TextField(
              onChanged: widget.onSearchChanged,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none, // Remove a borda da caixa de texto
              ),
            )
          : Text(
              '',
              style: TextStyle(color: Colors.black), // Cor do texto do título
            ),
      actions: [
        IconButton(
          icon: Icon(
            _isSearchExpanded
                ? Icons.close
                : Icons.search, // Alterna entre ícone de pesquisa e fechar
            color: Colors.black, // Cor do ícone
          ),
          onPressed: () {
            setState(() {
              _isSearchExpanded = !_isSearchExpanded;
              if (!_isSearchExpanded) {
                widget.onSearchChanged(""); // Limpa a pesquisa ao fechar
              }
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: widget.onCartPressed,
          color: Colors.black, // Cor do ícone do carrinho
        ),
      ],
      // flexibleSpace: Column(
      //   mainAxisAlignment: MainAxisAlignment.center, // Centralizar os ícones
      //   children: [
      //     // Image.asset(
      //     //   //'assets/cr.jpg', // Substitua 'sua_imagem.png' pelo caminho da sua imagem no projeto
      //     //   width: 64, // Metade do tamanho original
      //     //   height: 64, // Metade do tamanho original
      //     //   fit:
      //           BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível
      //     ),
      //     SizedBox(height: 8), // Espaço entre a imagem e os ícones
      //   ],
      //  ),
    );
  }
}
