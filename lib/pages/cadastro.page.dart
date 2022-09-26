import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdv_flutter/controllers/autenticacao.controller.dart';
import 'package:pdv_flutter/models/usuario.model.dart';
import 'package:pdv_flutter/repository/usuario.repository.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password1Controller = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "PAGINA DE CADASTRO",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do usuário',
                ),
              ),
              //
              TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Idade',
                ),
              ),
              //
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              //
              TextFormField(
                controller: _password1Controller,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              //
              TextFormField(
                controller: _password2Controller,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () async {
                    AutenticacaoController autenticadorController = AutenticacaoController();

                    bool senhasIguais = autenticadorController.verificarSeAsSenhasSaoIguais(
                      _password1Controller.text,
                      _password2Controller.text,
                    );

                    bool emailValido = autenticadorController.validarEmail(_emailController.text);
                    bool senhaValida = autenticadorController.validarSenha(_password1Controller.text);

                    if (senhasIguais && emailValido && senhaValida) {
                      UsuarioModel usuario = UsuarioModel(
                        nomeDeUsuario: _nomeController.text,
                        idade: int.parse(_idadeController.text),
                        email: _emailController.text,
                        senha: _password1Controller.text,
                      );

                      await autenticadorController.cadastrarUsuario(usuario);

                      Navigator.pop(context);
                    } else {
                      print("Senhas iguais $senhasIguais");
                      print("Email valido $emailValido");
                      print("Senha valida $senhaValida");
                    }
                  },
                  child: Text("Cadastrar Dados"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
