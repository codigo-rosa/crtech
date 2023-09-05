import 'package:crtech/tela/tela_pix.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crtech/produtos/produtos.dart';

class TelaDePagamento extends StatefulWidget {
  final List<Produtos> produtos;
  final double valorTotal;

  TelaDePagamento({required this.produtos, required this.valorTotal});

  @override
  _TelaDePagamentoState createState() => _TelaDePagamentoState();
}

class _TelaDePagamentoState extends State<TelaDePagamento> {
  String _selectedCardType = 'Visa';
  int _selectedInstallments = 1;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/cartao.png',
                    width: 180,
                    height: 70,
                  ),
                  SizedBox(width: 1),
                  Image.asset(
                    'assets/cartao2.png',
                    width: 180,
                    height: 70,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButton<String>(
                    value: _selectedCardType,
                    hint: Text('Selecione o tipo de cartão'),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCardType = newValue ?? 'Visa';
                      });
                    },
                    items: <String>['Visa', 'MasterCard', 'Amex', 'Outro']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    controller: _cardNumberController,
                    decoration: InputDecoration(labelText: 'Número do Cartão'),
                  ),
                  TextFormField(
                    controller: _expirationDateController,
                    decoration: InputDecoration(labelText: 'Data de Expiração'),
                  ),
                  TextFormField(
                    controller: _securityCodeController,
                    decoration:
                        InputDecoration(labelText: 'Código de Segurança'),
                  ),
                  DropdownButton<int>(
                    value: _selectedInstallments,
                    hint: Text('Selecione o número de parcelas'),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedInstallments = newValue ?? 1;
                      });
                    },
                    items: List.generate(12, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value Parcelas'),
                      );
                    }).toList(),
                  ),
                  Text(
                    'Valor Total: R\$ ${widget.valorTotal.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Valor Parcelado em $_selectedInstallments parcelas de R\$ ${(widget.valorTotal / _selectedInstallments).toStringAsFixed(2)} cada',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_validarCampos()) {
                        double valorParcela =
                            widget.valorTotal / _selectedInstallments;

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Detalhes do Pagamento'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Tipo de Cartão: $_selectedCardType'),
                                  Text(
                                      'Número do Cartão: ${_cardNumberController.text}'),
                                  Text(
                                      'Data de Expiração: ${_expirationDateController.text}'),
                                  Text(
                                      'Código de Segurança: ${_securityCodeController.text}'),
                                  Text(
                                      'Número de Parcelas: $_selectedInstallments'),
                                  Text(
                                      'Valor Total: R\$ ${widget.valorTotal.toStringAsFixed(2)}'),
                                  Text(
                                      'Valor de Cada Parcela: R\$ ${valorParcela.toStringAsFixed(2)}'),
                                ],
                              ),
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Campos obrigatórios'),
                              content:
                                  Text('Por favor, preencha todos os campos.'),
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
                    },
                    child: Text('Pagar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validarCampos() {
    return _selectedCardType.isNotEmpty &&
        _cardNumberController.text.isNotEmpty &&
        _expirationDateController.text.isNotEmpty &&
        _securityCodeController.text.isNotEmpty &&
        widget.valorTotal > 0.0;
  }
}
