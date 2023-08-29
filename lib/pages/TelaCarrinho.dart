import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/produtos.dart';
import 'package:ecommerce_app/main.dart';

class TelaCarrinho extends StatefulWidget {
  final List<Produtos> carrinho;

  const TelaCarrinho({Key? key, required this.carrinho}) : super(key: key);

  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: ListView.builder(
        itemCount: widget.carrinho.length,
        itemBuilder: (context, index) {
          final produto = widget.carrinho[index];
          return ListTile(
            leading: Image.asset(produto.imagem),
            title: Text(produto.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Preço: R\$ ${produto.preco}'),
                Text('Descrição: ${produto.descricao}'),
                Text('Quantidade: ${produto.quantidade}'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mostrarModalConfirmacao(context);
          setState(() {
            widget.carrinho
                .clear(); // Limpar a lista de carrinho após a confirmação
          });
        },
        child: Icon(Icons.check),
      ), // Chamar a função do modal ao pressionar o botão
    );
  }
}

void mostrarModalConfirmacao(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Produto Adicionado'),
        content: Text('O produto foi adicionado ao carrinho.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fechar o modal
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
