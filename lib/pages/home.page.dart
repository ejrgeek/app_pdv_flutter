import 'package:flutter/material.dart';
import 'package:pdv_flutter/pages/login.page.dart';
import 'package:pdv_flutter/repository/usuario.repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nomeDoUsuario = "";
  UsuarioRepository userR = UsuarioRepository();

  carregarDadosDoUsuario() async {
    String? nome = await userR.retornarNomeUsuario();

    setState(() {
      _nomeDoUsuario = nome!;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    carregarDadosDoUsuario();

    return Scaffold(
      //
      appBar: AppBar(
        title: Text(
          "Bem-vinda (o) $_nomeDoUsuario",
          style: TextStyle(fontSize: 12),
        ),
        actions: [
          IconButton(
            tooltip: "Deslogar",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(title: "Login"),
                ),
                ModalRoute.withName('/login'),
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      //
      body: Center(
        child: Column(
          children: <Widget>[
            //
            //
            //
          ],
        ),
        //
      ),
      //
    );
  }
}
