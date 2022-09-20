import 'package:flutter/material.dart';
import 'package:pdv_flutter/pages/cadastro.page.dart';
import 'package:pdv_flutter/pages/home.page.dart';
import 'package:pdv_flutter/repository/usuario.repository.dart';
import 'package:pdv_flutter/utils/constantes.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // CORPO DA APLICAÇÃO
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              // NOSSA LOGO
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  ConstantesPDV.logo,
                  height: 100,
                ),
              ),
              //
              // CAMPOS DE EMAIL E SENHA
              // email
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              // senha
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              // BOTÕES DE ENTRAR E CADASTRAR
              // BOTAO ENTRAR
              Container(
                padding: const EdgeInsets.only(top: 30),
                width: 300,
                height: 68,
                child: ElevatedButton(
                  onPressed: () async {
                    UsuarioRepository uR = UsuarioRepository();

                    bool senhasIguais = await uR.verificarSenha(_passwordController.text);
                    bool emailsIguais = await uR.verificarEmail(_emailController.text);

                    if (senhasIguais && emailsIguais) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        ModalRoute.withName('/home'),
                      );
                    } else {
                      print("FALHA NA AUTENTICACAO");
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: const Text('ENTRAR'),
                ),
              ),

              // DIVISIOR
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),

              // BOTÃO CADASTRAR
              SizedBox(
                width: 300,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CadastroPage()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: const Text('CADASTRAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
