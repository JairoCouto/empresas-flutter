import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  
  static const String _tokenPrefs = "token";
  static const String _uidPrefs = "uid";
  static const String _clientPrefs = "client";
  

  static final UserStorage instance = UserStorage._();

  String? _token;
  String? _client;
  String? _uid;
  UserStorage() {
    init();
  }
  UserStorage._();

  Future<void> init() async {
    try {
      _token = await getToken();
      _client = await getClient();
      _uid = await getUid();

    } catch (e) {
      rethrow;
    }
  }

  bool isLoggedIn() => token  != null ? true : false;

  String? get token => _token;
  String? get uid => _uid;
  String? get client => _client;

  //Função responsável por pegar o token da sessão referente ao usuário logado.
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenJson = prefs.get(_tokenPrefs) as String?;

    _token = tokenJson;

    return _token;
  }

  //Função responsável por pegar o uid do usuário logado.
  Future<String?> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uidJson = prefs.get(_uidPrefs) as String?;

    _uid = uidJson;

    return _uid;
  }

  //Função responsável por pegar o client do usuário logado
  Future<String?> getClient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clientJson = prefs.get(_clientPrefs) as String?;

    _client = clientJson;

    return _client;
  }

  //Função responsável por atualizar o token da sessão do usuário logado.
  Future<void> setToken(String? token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_tokenPrefs, token.toString());
    } catch (e) {
      throw 'Ocorreu um erro ao gravar o token da sessão';
    }
  }

  //Função responsável por atualizar o token da sessão do usuário logado.
  Future<void> setUid(String? uid) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_uidPrefs, uid.toString());
    } catch (e) {
      throw 'Ocorreu um erro ao gravar o token da sessão';
    }
  }

  //Função responsável por atualizar o token da sessão do usuário logado.
  Future<void> setClient(String? client) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_clientPrefs, client.toString());
    } catch (e) {
      throw 'Ocorreu um erro ao gravar o token da sessão';
    }
  }


  //Função responsável por remover as credenciais de sessão do shared;
  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _uid = null;
    _token = null;
    _client = null;

    await prefs.remove(_tokenPrefs);
    await prefs.remove(_uidPrefs);
    await prefs.remove(_clientPrefs);
  }

}