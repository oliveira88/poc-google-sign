class UsuarioDto {
  String? apelido;
  String? nome;
  String? email;
  String? photoUrl;

  @override
  String toString() {
    // TODO: implement toString
    return 'Apelido: $apelido\nNome: $nome\nEmail: $email\nPhotoUrl: $photoUrl';
  }
}
