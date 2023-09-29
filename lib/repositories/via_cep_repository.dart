import 'dart:convert';

import 'package:app_cep/models/consulta_cep_model.dart';
import 'package:http/http.dart' as http;

class ConsultaCepRepository {
  Future<ConsultaCEPModel> consultarCEP(String cep) async {
    var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ConsultaCEPModel.fromJson(json);
    }
    return ConsultaCEPModel();
  }
}
