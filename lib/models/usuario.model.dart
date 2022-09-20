import 'dart:convert';

class UsuarioModel {
  String? nomeDeUsuario;
  int? idade;
  String? email;
  String? senha;

  UsuarioModel({
    required this.nomeDeUsuario,
    required this.idade,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toJson() {
    return {
      "nomeDoUsuario": nomeDeUsuario,
      "idade": idade,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
