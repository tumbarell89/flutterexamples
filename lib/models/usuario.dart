
class Usuario{
  String _usuario;

  String get usuario => _usuario;

  set usuario(String usuario) {
    _usuario = usuario;
  }
  String _pass;

  String get pass => _pass;

  set pass(String pass) {
    _pass = pass;
  }

  Usuario(String user, String p){
    this.usuario=user;
    this.pass=pass;
  }

}