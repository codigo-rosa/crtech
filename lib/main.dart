import 'package:crtech/tela/tela_perfil.dart';
import 'package:crtech/tela/tela_abertura.dart';
import 'package:flutter/material.dart';
import 'package:crtech/produtos/produtos.dart';
import 'package:crtech/tela/tela_carrinho.dart';
import 'package:crtech/produtos/meus_produtos.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatelessWidget {
  // Classe principal do aplicativo
  const Aplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    // Método para construir a estrutura do aplicativo
    return MaterialApp(
      title: 'CR Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home:
          const TelaAbertura(), // Define a tela inicial como a classe TelaAbertura
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  final List<Produtos> carrinho;

  const PaginaPrincipal({Key? key, required this.carrinho}) : super(key: key);
  // Construtor da classe que recebe a lista 'carrinho' como parâmetro
  @override
  EstadoPaginaPrincipal createState() => EstadoPaginaPrincipal();
} // Retorna uma instância do EstadoPaginaPrincipal ao construir o estado deste widget

class EstadoPaginaPrincipal extends State<PaginaPrincipal> {
  // Classe que gerencia o estado da PaginaPrincipal

  int isSelected = 0; // Variável para controlar o item selecionado
  String searchText = ""; // Variável para armazenar o texto de busca
  List<Produtos> listaDeProdutos = MeusProdutos
      .todosProdutos; // Lista de todos os produtos disponíveis, vinda da classe MeusProdutos
  List<Produtos> produtosFiltrados =
      []; //Lista para armazenar os produtos após aplicar um filtro de busca
  List<Produtos> carrinho =
      []; // Lista que armazenará os produtos selecionados para o carrinho de compras

  @override
  Widget build(BuildContext context) {
    // Método de construção da interface da página

    // Filtrar a lista de produtos com base no texto de busca e armazena na lista 'produtosFiltrados'
    produtosFiltrados = listaDeProdutos.where((produtos) {
      return produtos.descricao
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    //aqui vamos exibir a imagem no topo
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 215.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo.jpg',
              width: 80.0,
              height: 80.0,
            ),

            const Align(
              //aqui criamos um layout alinhado à esquerda com dois textos formatados.
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Olá usuário,',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'O que está procurando hoje?',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Container que envolve uma linha contendo um campo de texto para pesquisa.
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            searchText =
                                text; // Atualiza o texto de busca conforme o usuário digita
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Digite aqui para buscar',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 249, 247, 247),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),

      // Isso cria uma barra de navegação inferior com ícones de navegação
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home,
                    color: Color.fromARGB(255, 10, 10, 10)),
                onPressed:
                    () {}, // Lógica ao pressionar o ícone de casa (não fizemos)
              ),
              IconButton(
                icon: const Icon(
                    Icons.shopping_cart, // Ícone de carrinho de compras
                    color: Color.fromARGB(255, 10, 10, 10)),
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
                icon: const Icon(Icons.person, // Ícone de perfil
                    color: Color.fromARGB(255, 10, 10, 10)),
                onPressed: () {
                  // Lógica ao pressionar o ícone de perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TelaPerfil(), // Navega para a tela de perfil
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Corpo da tela, composto por uma coluna que contém as categorias e os produtos exibidos
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: Column(
          children: [
            construirCategoriasDeProdutos(), // Chamada de função para construir categorias de produtos
            Expanded(
              child:
                  construirProdutosExibidos(), // Chamada de função para construir produtos exibidos
            ),
          ],
        ),
      ),
    );
  }

// Função para construir o card de um produto
  Widget construirCardDeProdutos(Produtos produtos) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              produtos.imagem,
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
          // Descrição do produto com estilo definido
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
          // Preço do produto formatado com estilo definido
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                carrinho.add(produtos);
              });
              mostrarModalConfirmacao(
                  context); // Mostrar um modal de confirmação
            },
            // Botão "Adicionar ao Carrinho" com estilo definido
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
        ],
      ),
    );
  }

// Função que mostra um modal de confirmação quando um produto é adicionado ao carrinho
  void mostrarModalConfirmacao(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Produto adicionado ao carrinho.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o modal
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Função para construir a seção de categorias de produtos
  Widget construirCategoriasDeProdutos() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Rolamento horizontal das categorias
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Chamada de função para construir categorias na parte superior da tela
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
    required int index, //passar informações para a função quando ela é chamada.
    required String nome,
  }) {
    return GestureDetector(
      // Função para construir uma categoria de produtos individual, atualiza a categoria selecionada
      onTap: () {
        setState(() {
          isSelected = index; // Define a categoria selecionada
          searchText = ""; // Limpa o texto de busca
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
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

// Define a lista de produtos a ser exibida com base na categoria selecionada
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

    // Constrói uma grade de produtos na parte principal da tela
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
