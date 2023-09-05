import 'package:crtech/detalhes_produto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crtech/appBar.dart';
import 'package:crtech/barra_inferior.dart';
import 'package:crtech/produtos/meus_produtos.dart';
import 'package:crtech/produtos/produtos.dart';
import 'package:crtech/tela/carrrossel.dart';
import 'package:crtech/tela/tela_carrinho.dart';

class PaginaPrincipal extends StatefulWidget {
  final List<Produtos> carrinho;

  const PaginaPrincipal({Key? key, required this.carrinho}) : super(key: key);

  @override
  _EstadoPaginaPrincipal createState() => _EstadoPaginaPrincipal();
}

class _EstadoPaginaPrincipal extends State<PaginaPrincipal> {
  int isSelected = 0;
  List<bool> favoritos = List.filled(MeusProdutos.todosProdutos.length, false);
  String searchText = "";
  List<Produtos> listaDeProdutos = MeusProdutos.todosProdutos;
  List<Produtos> carrinho = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaCarrinho(carrinho: carrinho),
            ),
          );
        },
        onSearchChanged: (text) {
          setState(() {
            searchText = text;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: Column(
          children: [
            Carrossel(), // Adicione o carrossel aqui
            construirCategoriasDeProdutos(),
            Expanded(
              child: construirProdutosExibidos(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onTabSelected: (index) {
          setState(() {
            isSelected = index;
          });
        },
        selectedIndex: isSelected,
        favoritos: favoritos,
      ),
    );
  }

  Widget construirCardDeProdutos(Produtos produtos, int index, int id) {
    double _rating = 0.0;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesProdutoMaior(
                      produto: produtos,
                      todosProdutos: [],
                    ),
                  ),
                );
              },
              child: Image.asset(
                produtos.imagem,
              ),
            ),
          ),
          Text(
            produtos.descricao,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(produtos.preco)}',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                carrinho.add(produtos);
              });
              mostrarModalConfirmacao(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 240, 238, 239),
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Adicionar ao Carrinho',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Ícone de coração para favoritar
          IconButton(
            icon: Icon(
              favoritos[index] ? Icons.favorite : Icons.favorite_border,
              color: Colors.red, // Cor do ícone de coração
            ),
            onPressed: () {
              setState(() {
                favoritos[index] = !favoritos[index];
              });
            },
          ),
        ],
      ),
    );
  }

  void mostrarModalConfirmacao(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Produto adicionado ao carrinho.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget construirCategoriasDeProdutos() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            construirCategoriaDeProdutos(index: 0, nome: "Ver tudo"),
            construirCategoriaDeProdutos(index: 1, nome: "Gamer"),
            construirCategoriaDeProdutos(index: 2, nome: "Rede"),
            construirCategoriaDeProdutos(index: 3, nome: "Hardware"),
          ],
        ),
      ),
    );
  }

  Widget construirCategoriaDeProdutos({
    required int index,
    required String nome,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
          searchText = "";
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          nome,
          style: TextStyle(
            color: isSelected == index ? Colors.white : Colors.pink,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget construirProdutosExibidos() {
    List<Produtos> produtosExibidos;

    produtosExibidos = listaDeProdutos.where((produto) {
      return produto.descricao.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    if (isSelected == 1) {
      produtosExibidos = produtosExibidos.where((produto) {
        return MeusProdutos.listaGamer.contains(produto);
      }).toList();
    } else if (isSelected == 2) {
      produtosExibidos = produtosExibidos.where((produto) {
        return MeusProdutos.listaDeRede.contains(produto);
      }).toList();
    } else if (isSelected == 3) {
      produtosExibidos = produtosExibidos.where((produto) {
        return MeusProdutos.listaDeHardware.contains(produto);
      }).toList();
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 3,
      ),
      itemCount: produtosExibidos.length,
      itemBuilder: (context, index) {
        final produtos = produtosExibidos[index];
        return construirCardDeProdutos(produtos, index, produtos.id);
      },
    );
  }
}
