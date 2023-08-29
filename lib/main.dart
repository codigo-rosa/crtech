import 'package:ecommerce_app/TelaPerfil.dart';
import 'package:ecommerce_app/pages/TelaAbertura.dart';
import 'package:ecommerce_app/pages/TelaCarrinho.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/produtos.dart';
import 'package:ecommerce_app/models/meusProdutos.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CR Tech',
      debugShowCheckedModeBanner: false, // Remover o banner de debug
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 245, 246, 247),
      ),
      home: const TelaAbertura(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  final List<Produtos> carrinho;

  const PaginaPrincipal({Key? key, required this.carrinho}) : super(key: key);

  @override
  EstadoPaginaPrincipal createState() => EstadoPaginaPrincipal();
}

class EstadoPaginaPrincipal extends State<PaginaPrincipal> {
  int isSelected = 0;
  String searchText = ""; // Variável para armazenar o texto de busca
  List<Produtos> listaDeProdutos = MeusProdutos.todosProdutos;
  List<Produtos> produtosFiltrados =
      []; // Lista para armazenar produtos filtrados
  List<Produtos> carrinho = []; // Declarar a lista carrinho aqui

  @override
  Widget build(BuildContext context) {
    //TEXTOOO
    // Filtrar a lista de produtos com base no texto de busca
    produtosFiltrados = listaDeProdutos.where((produtos) {
      return produtos.descricao
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 215.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo.jpg', // Caminho da imagem
              width: 90.0,
              height: 90.0,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Olá usuário',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0), // Espaçamento entre os textos
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'O que está procurando hoje?',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(
                  255, 255, 255, 255), // Cor de fundo da barra
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            searchText = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Digite aqui para buscar',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0), // Espaço abaixo da barra de busca
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 11, 11, 11),
        child: SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.pink),
                onPressed: () {
                  // Lógica ao pressionar o ícone de home
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart,
                    color: Colors.pink), // Use o ícone de carrinho
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaCarrinho(carrinho: carrinho),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.pink),
                onPressed: () {
                  // Lógica ao pressionar o ícone de perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaPerfil(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ), //CATEGORIAS
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: Column(
          children: [
            construirCategoriasDeProdutos(), //FUNCAO
            Expanded(
              child: construirProdutosExibidos(),
            ),
          ],
        ),
      ),
    );
  }

  Widget construirCardDeProdutos(Produtos produtos) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 247, 235, 239),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              produtos.imagem,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            produtos.descricao,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            produtos.preco,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              color: Colors.black26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                carrinho.add(produtos); // Adicionar o produto ao carrinho
              });
              mostrarModalConfirmacao(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Adicionar ao Carrinho'),
          ),
        ],
      ),
    );
  }

  Widget construirCategoriasDeProdutos() {
    return Container(
      color: Color.fromARGB(255, 10, 10, 10),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity, // Para ocupar a largura total da tela
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinha os itens à esquerda
          children: [
            construirCategoriaDeProdutos(index: 0, nome: "Todos os Produtos"),
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
          color: Color.fromARGB(255, 10, 10, 10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          nome,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  Widget construirProdutosExibidos() {
    List<Produtos> produtosExibidos;

    if (isSelected == 0) {
      produtosExibidos = produtosFiltrados;
    } else if (isSelected == 1) {
      produtosExibidos = MeusProdutos.listaGamer;
    } else if (isSelected == 2) {
      produtosExibidos = MeusProdutos.listaDeRede;
    } else if (isSelected == 3) {
      produtosExibidos = MeusProdutos.listaDeHardware;
    } else {
      produtosExibidos = [];
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
        return construirCardDeProdutos(produtos);
      },
    );
  }
}
