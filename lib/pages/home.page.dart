import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdv_flutter/pages/login.page.dart';
import 'package:pdv_flutter/repository/usuario.repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> dadosDoUsuario = {};

  UsuarioRepository userR = UsuarioRepository();

  carregarDadosDoUsuario() async {
    Map<String, dynamic> dadosLocais = await userR.retornarNomeEEmail();

    setState(() {
      dadosDoUsuario = dadosLocais;
    });
  }

  @override
  void initState() {
    carregarDadosDoUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text(
          "Bem-vinda(o), ${dadosDoUsuario['nome']}",
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
            Text("Nome do usuário: ${dadosDoUsuario['nome']}"),
            Text("Email do usuário: ${dadosDoUsuario['email']}"),
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
