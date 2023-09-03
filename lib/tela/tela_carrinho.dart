// import 'package:crtech/tela/pagamento.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Importe para formatar a moeda R$
// import 'package:crtech/produtos/produtos.dart';

// class TelaCarrinho extends StatefulWidget {
//   final List<Produtos> carrinho;

//   const TelaCarrinho({Key? key, required this.carrinho}) : super(key: key);

//   @override
//   TelaCarrinhoState createState() => TelaCarrinhoState();
// }

// class TelaCarrinhoState extends State<TelaCarrinho> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Carrinho de Compras'),
//         backgroundColor:
//             Colors.pink, // Define a cor de fundo da barra de aplicativo
//       ),
//       body: widget.carrinho.isEmpty
//           ? Center(
//               child: Text(
//                 'Seu carrinho está vazio!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             )
//           : ListView.builder(
//               itemCount: widget.carrinho.length,
//               itemBuilder: (context, index) {
//                 final produto = widget.carrinho[index];
//                 return ListTile(
//                   leading: Image.asset(produto.imagem),
//                   title: Text(produto.nome),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Preço: R\$ ${produto.preco}'),
//                       Text('Descrição: ${produto.descricao}'),
//                       Text('Quantidade: ${produto.quantidade}'),
//                     ],
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () {
//                           setState(() {
//                             widget.carrinho.removeAt(index);
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (widget.carrinho.isEmpty) {
//             // Se o carrinho estiver vazio, retornar à tela inicial
//             Navigator.popUntil(context, (route) => route.isFirst);
//           } else {
//             mostrarModalExclusao(context);
//             setState(() {
//               widget.carrinho
//                   .clear(); // Limpar a lista de carrinho após a confirmação
//             });
//           }
//         },
//         // Exibir o total do carrinho em formato de moeda (R$)
//         child: const Icon(Icons.clear),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           'Total: R\$${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(calcularTotalCarrinho(widget.carrinho))}',
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// void mostrarModalExclusao(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('Produtos removidos'),
//         content: const Text(''),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // Fechar o modal
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }

// double calcularTotalCarrinho(List<Produtos> carrinho) {
//   double total = 0.0;
//   for (var produto in carrinho) {
//     total += produto.preco * produto.quantidade;
//   }
//   return total;
// }

import 'package:crtech/tela/pagamento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crtech/produtos/produtos.dart';

class TelaCarrinho extends StatefulWidget {
  final List<Produtos> carrinho;

  const TelaCarrinho({Key? key, required this.carrinho}) : super(key: key);

  @override
  TelaCarrinhoState createState() => TelaCarrinhoState();
}

class TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        backgroundColor: Colors.pink,
      ),
      body: widget.carrinho.isEmpty
          ? Center(
              child: Text(
                'Seu carrinho está vazio!',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.carrinho.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.carrinho.isEmpty) {
            Navigator.popUntil(context, (route) => route.isFirst);
          } else {
            // Navegue para a tela de pagamento ao clicar em "Comprar"
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TelaDePagamento(produtos: widget.carrinho),
              ),
            );
          }
        },
        child: const Icon(Icons.payment), // Ícone para "Comprar"
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: R\$${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(calcularTotalCarrinho(widget.carrinho))}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  double calcularTotalCarrinho(List<Produtos> carrinho) {
    double total = 0.0;
    for (var produto in carrinho) {
      total += produto.preco * produto.quantidade;
    }
    return total;
  }
}
