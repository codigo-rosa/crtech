import 'package:crtech/main.dart';
import 'package:flutter/material.dart';
import 'package:crtech/tela/carrrossel.dart';

class TelaPerfil extends StatelessWidget {
// Declaração dos controladores para os campos de texto
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    // Navega para a tela Carrossel automaticamente quando a tela for construída
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Carrossel()),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Retornar para página inicial'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(253, 207, 230, 1),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('logo/perfil.png'),
                  ),

                  const SizedBox(
                      height: 40), // Espaço entre a imagem e as barras
                  // Campo de texto para o nome do usuário
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Usuário',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20), // Espaço entre os campos
                  // Campo de texto para o e-mail
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(
                      height: 40), // Espaço entre os campos e o botão
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
                            builder: (context) => const Aplicativo()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
                    ),
                    child: const Text(
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

  void enviarDados(String nome, String email) {
    // Lógica para enviar os dados para o console
    print('Nome: $nome');
    print('Email: $email');
  }
}
