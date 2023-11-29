import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String mensagem = "";

Future<bool> setEstadoBomba(bool value) async {
  String urlGet = "https://alanoliveira.pythonanywhere.com/bombausuario/1/";
  int id = 0;
  bool userAuth = false;

  try {
    var responseGet = await http.get(Uri.parse(urlGet));

    if (responseGet.statusCode == 200) {
      final data = json.decode(responseGet.body);

      id = data['id'];
      userAuth = data['user'];
    }

    if (id == 1 && userAuth == true) {
      String url =
          "https://alanoliveira.pythonanywhere.com/bombausuario/${id.toString()}/";
      var response =
          await http.patch(Uri.parse(url), body: {"bomba": value.toString()});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  } catch (e) {
    return false;
  }
}

Future<bool> setEstadoUser() async {
  String urlGet = "https://alanoliveira.pythonanywhere.com/bombausuario/1/";
  int id = 0;
  bool userAuth = false;
  bool value = true;

  try {
    var responseGet = await http.get(Uri.parse(urlGet));

    if (responseGet.statusCode == 200) {
      final data = json.decode(responseGet.body);
      id = data['id'];
      userAuth = data['user'];
    }

    if (id == 1) {
      if (userAuth == true) {
        value = false;
      } else {
        value = true;
      }

      String url =
          "https://alanoliveira.pythonanywhere.com/bombausuario/${id.toString()}/";
      var response =
          await http.put(Uri.parse(url), body: {"user": value.toString()});

      if (response.statusCode == 200) {
        mensagem = value ? "User Autorizado" : "User Não Autorizado";
        return true;
      } else {
        mensagem = "Erro ao mudar o estado do user";
        return false;
      }
    }
    mensagem = "Erro ao mudar o estado do user";
    return false;
  } catch (e) {
    mensagem = "Erro ao mudar o estado do user";
    return false;
  }
}

String getMensagem() {
  return mensagem;
}

Future<bool> getEstadoBomba() async {
  String url = "https://alanoliveira.pythonanywhere.com/bombausuario/1/";
  int id = 0;
  bool value = false;

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      id = data['id'];
      value = data['bomba'];
    }

    if (id == 1) {
      return value;
    }
    return false;
  } catch (e) {
    return false;
  }
}
