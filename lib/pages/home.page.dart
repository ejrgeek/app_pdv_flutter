import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdv_flutter/controllers/home.controller.dart';
import 'package:pdv_flutter/models/usuario.model.dart';
import 'package:pdv_flutter/pages/login.page.dart';
import 'package:pdv_flutter/repository/usuario.repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UsuarioModel? dadosDoUsuario;

  HomeController homeController = HomeController();

  carregarDadosDoUsuario() async {
    UsuarioModel usuarioLocal = await homeController.popularUsuario();
    setState(() {
      dadosDoUsuario = usuarioLocal;
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
          "Bem-vinda(o), ${dadosDoUsuario!.nomeDeUsuario}",
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
            Text("Nome do usuário: ${dadosDoUsuario!.nomeDeUsuario}"),
            Text("Email do usuário: ${dadosDoUsuario!.email}"),
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
