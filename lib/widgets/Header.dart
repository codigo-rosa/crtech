import 'package:ecommerce_app/TelaPerfil.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
          iconSize: 16,
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          color: ModalRoute.of(context)!.settings.name != '/'
              ? const Color.fromRGBO(18, 18, 20, 1)
              : const Color.fromRGBO(236, 33, 99, 1)),
      title: const Image(image: AssetImage('assets/logo/logo.jpg'), height: 30),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined,
              color: ModalRoute.of(context)!.settings.name != '/cart'
                  ? const Color.fromRGBO(18, 18, 20, 1)
                  : const Color.fromRGBO(236, 33, 99, 1)),
          iconSize: 16,
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
          icon: const Icon(Icons.person_outlined,
              color: Color.fromRGBO(18, 18, 20, 1)),
          onPressed: () {
            // Lógica ao pressionar o ícone de perfil
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaPerfil(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
