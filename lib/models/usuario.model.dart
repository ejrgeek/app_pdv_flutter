class UsuarioModel {
  int? id;
  String? nomeDeUsuario;
  String? email;
  String? senha;

  UsuarioModel({
    required this.nomeDeUsuario,
    required this.email,
    required this.senha,
  });

  @override
  String toString() {
    return "<'UsuarioModel' => 'id'=$id 'nomeDeUsuario'=$nomeDeUsuario, 'email'=$email>";
  }
}
