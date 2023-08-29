import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_app/widgets/Header.dart';
import 'package:ecommerce_app/models/produtos.dart';
import 'package:ecommerce_app/models/meusProdutos.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: PaginaPrincipal(),
      backgroundColor: Colors.white,
    );
  }
}

class HomePresentation extends StatelessWidget {
  const HomePresentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text('Olá!',
                  style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text('O que está procurando hoje?',
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))),
              ))
        ],
      ),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  EstadoPaginaPrincipal createState() => EstadoPaginaPrincipal();
}

class EstadoPaginaPrincipal extends State<PaginaPrincipal> {
  int isSelected = 0;
  String searchText = "";
  List<Produtos> listaDeProdutos = MeusProdutos.todosProdutos;


  @override
  Widget build(BuildContext context) {
    List<Produtos> produtosfiltrados = listaDeProdutos.where((produtos) {
      return produtos.descricao
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Container(
      child: Column(
        children: [
          const HomePresentation(),
          construirCategoriasDeProdutos(),
          Expanded(
            child: isSelected == 0
                ? construirProdutosFiltrados(MeusProdutos.todosProdutos)
                : isSelected == 1
                    ? construirProdutosFiltrados(MeusProdutos.listaGamer)
                    : isSelected == 2
                        ? construirProdutosFiltrados(MeusProdutos.listaDeRede)
                        : construirProdutosFiltrados(
                            MeusProdutos.listaDeHardware),
          ),
        ],
      ),
    );
  }

  Widget construirCategoriasDeProdutos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: double.infinity, // Para ocupar a largura total da tela
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Alinha os itens à esquerda
            children: [
              const SizedBox(width: 10),
              construirCategoriaDeProdutos(index: 0, nome: "Todos os Produtos"),
              const SizedBox(width: 10),
              construirCategoriaDeProdutos(index: 1, nome: "Gamer"),
              const SizedBox(width: 10),
              construirCategoriaDeProdutos(index: 2, nome: "Rede"),
              const SizedBox(width: 10),
              construirCategoriaDeProdutos(index: 3, nome: "Hardware"),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget construirCategoriaDeProdutos(
      {required int index, required String nome}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0, vertical: 8.0), // Adicionei o padding vertical
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(64, 64, 64, 1),
        ),
        child: Text(
          nome,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget construirProdutosFiltrados(List<Produtos> listaDeProdutos) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        itemCount: listaDeProdutos.length,
        itemBuilder: (context, index) {
          final produtos = listaDeProdutos[index];
          return construirCardDeProdutos(produtos);
        },
      ),
    );
  }

  Widget construirCardDeProdutos(Produtos produtos) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              produtos.imagem,
              fit: BoxFit.contain,
              height: 30,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              produtos.descricao,
              style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                NumberFormat.compactSimpleCurrency(
                        locale: 'pt-BR', decimalDigits: 2)
                    .format(double.parse(produtos.preco)),
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: const Color.fromRGBO(236, 33, 99, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Adicionar ao Carrinho',
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
