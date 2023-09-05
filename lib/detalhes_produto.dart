import 'package:crtech/produtos/produtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:crtech/produtos/produtos.dart';
import 'package:crtech/produtos/meus_produtos.dart';

class DetalhesProdutoMaior extends StatefulWidget {
  final Produtos produto;
  final List<Produtos> todosProdutos;

  DetalhesProdutoMaior({
    required this.produto,
    required this.todosProdutos,
  });

  @override
  _DetalhesProdutoMaiorState createState() => _DetalhesProdutoMaiorState();
}

class _DetalhesProdutoMaiorState extends State<DetalhesProdutoMaior> {
  double _rating = 0.0;
  TextEditingController _commentController = TextEditingController();
  bool _comentarioEnviado = false;
  List<Produtos> produtosSugeridos = [];

  @override
  void initState() {
    super.initState();

    // Encontre produtos relacionados com base no ID do produto atual
    produtosSugeridos = widget.todosProdutos
        .where((produto) => produto.id != widget.produto.id)
        .toList();
  }

  @override
  void _enviarComentario() {
    final comentario = _commentController.text;
    print('Comentário enviado pelo cliente: $comentario');
    setState(() {
      _comentarioEnviado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: ListView(
        children: [
          // Exiba a imagem em tamanho menor
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.produto.imagem,
              width: 150, // Defina o tamanho desejado
              height: 150,
            ),
          ),
          Text('Nome: ${widget.produto.nome}'),
          Text('Preço: R\$ ${widget.produto.preco.toStringAsFixed(2)}'),
          Text('Descrição: ${widget.produto.descricao}'),

          // Ícone de estrela para avaliação
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),

          // Espaço para comentário
          _comentarioEnviado
              ? SizedBox.shrink() // Oculta o espaço do comentário após o envio
              : Column(
                  children: [
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        labelText: 'Comentário',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _enviarComentario(); // Chama o método para enviar o comentário
                      },
                      child: Text('Enviar Comentário'),
                    ),
                  ],
                ),

          // Espaço para sugestões de produtos
          SizedBox(height: 20.0),
          Text(
            'Sugestões de Produtos',
            style: TextStyle(fontSize: 18),
          ),
          // Lista de produtos sugeridos
          Column(
            children: produtosSugeridos.map((produto) {
              return ListTile(
                leading: Image.asset(
                  produto.imagem,
                  width: 50,
                  height: 50,
                ),
                title: Text(produto.nome),
                onTap: () {
                  // Navegue para a página de detalhes deste produto
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetalhesProdutoMaior(
                        produto: produto,
                        todosProdutos: widget.todosProdutos,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
