import 'package:crtech/produtos/produtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AvaliacaoClientePage extends StatefulWidget {
  @override
  _AvaliacaoClientePageState createState() => _AvaliacaoClientePageState();
}

class _AvaliacaoClientePageState extends State<AvaliacaoClientePage> {
  double _rating = 0.0;
  String _comment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliação do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Avalie este produto:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20.0),
            RatingBar.builder(
              initialRating: _rating,
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
            SizedBox(height: 20.0),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Digite seu comentário...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _comment = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acessando os valores da avaliação e do comentário
                double avaliacao = _rating;
                String comentario = _comment;

                // Enviar os dados para o servidor ou fazer outra ação
                enviarAvaliacao(avaliacao, comentario);
              },
              child: Text('Enviar Avaliação'),
            ),
          ],
        ),
      ),
    );
  }

  void enviarAvaliacao(double avaliacao, String comentario) {
    // Aqui você pode implementar a lógica para enviar a avaliação para o servidor ou realizar ação local
    // Por exemplo, você pode imprimir os valores para simulação:
    print('Avaliação: $avaliacao');
    print('Comentário: $comentario');

    // Após enviar, você pode navegar de volta ou fazer outra ação
    Navigator.pop(context);
  }
}

class DetalhesProduto extends StatelessWidget {
  final Produtos produto;

  DetalhesProduto({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(produto.imagem),
            Text('Nome: ${produto.nome}'),
            Text('Preço: R\$ ${produto.preco.toStringAsFixed(2)}'),
            Text('Descrição: ${produto.descricao}'),
            // Adicione outras informações do produto aqui

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
                // Aqui você pode lidar com a avaliação do produto
                // O valor de 'rating' representa a avaliação do produto
                print('Avaliação do Produto ${produto.nome}: $rating');
              },
            ),
          ],
        ),
      ),
    );
  }
}
