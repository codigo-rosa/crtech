import 'package:flutter/material.dart';
import 'package:crtech/produtos/produtos.dart';

class TelaDePagamento extends StatelessWidget {
  final List<Produtos> produtos;

  TelaDePagamento({required this.produtos});

  // Função para realizar o pagamento
  void _realizarPagamento(BuildContext context, String metodo) {
    // Adicione aqui a lógica de pagamento com base no método escolhido.
    // Você pode integrar com serviços de pagamento real ou simplesmente simular o pagamento.

    // Vamos simular o pagamento com um atraso de 2 segundos.
    Future.delayed(Duration(seconds: 2), () {
      // Após o atraso, verifique se o pagamento foi bem-sucedido.
      bool pagamentoBemSucedido = true; // Simulando um pagamento bem-sucedido.

      if (pagamentoBemSucedido) {
        // Se o pagamento for bem-sucedido, exiba uma mensagem de sucesso.
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Pagamento bem-sucedido'),
              content: Text('O pagamento foi concluído com sucesso.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Se o pagamento falhar, exiba uma mensagem de falha.
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Pagamento falhou'),
              content: Text('O pagamento não pôde ser processado.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento'),
      ),
      body: Column(
        children: [
          // Exibe os produtos selecionados para compra
          Expanded(
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(produtos[index].nome),
                  // Outras informações do produto aqui
                );
              },
            ),
          ),
          // Opções de pagamento
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _realizarPagamento(context, 'Cartão de Crédito');
                  },
                  child: Text('Pagar com Cartão de Crédito'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _realizarPagamento(context, 'PIX');
                  },
                  child: Text('Pagar com PIX'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
