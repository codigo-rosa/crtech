import 'package:crtech/produtos/meusProdutos.dart';
import 'package:crtech/produtos/produtoCard.dart';
import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => EstadoTelaHome();
}

class EstadoTelaHome extends State<TelaHome> {
  int isSelected = 0; // Esta variável controla a categoria selecionada
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Nossos Produtos",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              construirCategoriasDeProdutos(index: 0, nome: "Todos produtos"),
              construirCategoriasDeProdutos(index: 1, nome: "Gamer"),
              construirCategoriasDeProdutos(index: 2, nome: "Rede"),
              construirCategoriasDeProdutos(index: 3, nome: "Harware"),
            ],
          ),
          const SizedBox(
              height: 80), // Espaçamento entre os botões e o conteúdo abaixo

          Expanded(
            child: isSelected == 0
                ? construirTodosOsProdutos()
                : isSelected == 1
                    ? construirGamer()
                    : isSelected == 2
                        ? construirRede()
                        : construirHardware(),
          ),
        ],
      ),
    );
  }

  construirCategoriasDeProdutos({required int index, required String nome}) =>
      GestureDetector(
        onTap: () => setState(
            () => isSelected = index), // Atualiza a categoria selecionada
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index
                  ? Color.fromARGB(255, 252, 251, 255)
                  : Color.fromARGB(255, 26, 6, 62),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            nome,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  construirTodosOsProdutos() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MeusProdutos.todosProdutos.length,
        itemBuilder: (context, index) {
          final todosProdutos = MeusProdutos.todosProdutos[index];
          return ProdutoCard(produtos: todosProdutos);
        },
      );

  construirGamer() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MeusProdutos.listaGamer.length,
        itemBuilder: (context, index) {
          final listaGamer = MeusProdutos.listaGamer[index];
          return ProdutoCard(produtos: listaGamer);
        },
      );

  construirHardware() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (50 / 70),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MeusProdutos.listaDeHardware.length,
        itemBuilder: (context, index) {
          final listaDeHardware = MeusProdutos.listaDeHardware[index];
          return ProdutoCard(produtos: listaDeHardware);
        },
      );

  construirRede() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (30 / 30),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MeusProdutos.listaDeRede.length,
        itemBuilder: (context, index) {
          final listaDeRede = MeusProdutos.listaDeRede[index];
          return ProdutoCard(produtos: listaDeRede);
        },
      );
}
