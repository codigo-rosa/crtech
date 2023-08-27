import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/pages/TelaHome.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  // Declaração dos controladores para os campos de texto
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Obtém as dimensões da tela
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 40, 72),
        title: Text('Retornar para página principal'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fundo gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 109, 182, 1),
                  Color.fromRGBO(253, 207, 230, 1),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagem do perfil
                  Container(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('logo/perfil.png'),
                    ),
                  ),
                  SizedBox(height: 40), // Espaço entre a imagem e as barras
                  // Campo de texto para o nome do usuário
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome do Usuário',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20), // Espaço entre os campos
                  // Campo de texto para o e-mail
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 40), // Espaço entre os campos e o botão
                  // Botão "Entrar"
                  ElevatedButton(
                    onPressed: () {
                      // Obtém os valores dos campos
                      String nome = nomeController.text;
                      String email = emailController.text;

                      // Chama o método para enviar os dados
                      enviarDados(nome, email);

                      // Limpa os campos
                      nomeController.clear();
                      emailController.clear();

                      // Navega para a página principal
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Aplicativo()), // Substitua "HomePage" pela classe da sua página principal
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 2, 40, 72), // Cor do botão
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para enviar os dados (pode ser personalizado conforme sua necessidade)
  void enviarDados(String nome, String email) {
    // Lógica para enviar os dados para algum lugar (exemplo: imprimir no console)
    print('Nome: $nome');
    print('Email: $email');
  }
}
