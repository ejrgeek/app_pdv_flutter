import 'package:flutter/material.dart';
import 'package:pdv_flutter/pages/cadastro.page.dart';
import 'package:pdv_flutter/utils/constantes.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: (String textoDigitado) {
                    print(textoDigitado);
                  },
                ),
              ),
              // senha
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                onChanged: (String textoDigitado) {
                  print(textoDigitado);
                },
              ),
              // BOTÕES DE ENTRAR E CADASTRAR
              // BOTAO ENTRAR
              Container(
                padding: const EdgeInsets.only(top: 30),
                width: 300,
                height: 68,
                child: ElevatedButton(
                  onPressed: () {
                    print("CLICADO EM 'ENTRAR'");
                  },
                  child: const Text('ENTRAR'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ),

              // DIVISIOR
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
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
                    print("CLICADO EM 'CADASTRAR'");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CadastroPage()),
                      ),
                    );
                  },
                  child: const Text('CADASTRAR'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
