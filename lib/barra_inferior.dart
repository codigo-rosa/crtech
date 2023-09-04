import 'package:crtech/avaliacao_cliente.dart';
import 'package:crtech/tela/tela_perfil.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int selectedIndex;
  final List<bool> favoritos;

  CustomBottomAppBar({
    required this.onTabSelected,
    required this.selectedIndex,
    required this.favoritos,
  });

  // Método para abrir a página de favoritos
  void _openFavoritesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritosPage(favoritos: favoritos),
      ),
    );
  }

// Método para abrir a página de perfil
  void _openProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaPerfil(),
      ),
    );
  }

  // Método para abrir a página de avaliação do cliente
  // void _openAvaliacaoClientePage(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AvaliacaoClientePage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => onTabSelected(0),
            color: selectedIndex == 0 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.favorite), // Ícone de coração
            onPressed: () =>
                _openFavoritesPage(context), // Abre a página de favoritos
            color: selectedIndex == 1 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.person), // Ícone de perfil do usuário
            onPressed: () =>
                _openProfilePage(context), // Abre a página de perfil
            color: selectedIndex == 2
                ? Colors.blue
                : Colors
                    .grey, // Altere o ícone ativo/inativo conforme necessário
          ),
        ],
      ),
    );
  }
}

class FavoritosPage extends StatelessWidget {
  final List<bool> favoritos;

  FavoritosPage({required this.favoritos});

  @override
  Widget build(BuildContext context) {
    // Aqui você pode criar a interface para exibir a lista de favoritos
    // usando a lista favoritos passada como parâmetro.

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          // Construa cada item da lista de favoritos aqui
          // Use favoritos[index] para determinar se o item é um favorito.
          // Exiba os produtos favoritos de acordo com a lógica do seu aplicativo.
          return ListTile(
            title: Text('Produto ${index + 1}'),
            // Exiba um ícone de coração preenchido se for favorito, caso contrário, vazio.
            leading:
                Icon(favoritos[index] ? Icons.favorite : Icons.favorite_border),
          );
        },
      ),
    );
  }
}
