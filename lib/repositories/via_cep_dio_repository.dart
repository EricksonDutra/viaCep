import 'package:app_cep/models/consulta_cep_model.dart';
import 'package:app_cep/models/via_cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepDioRepository {
  final _dio = Dio();

  ViaCepDioRepository() {
    _dio.options.headers["X-Parse-Application-Id"] = dotenv.get("BACK4APP_ID");
    _dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get("BACK4APP_KEY");
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<ViaCEPsModel> consultarCEP() async {
    var res = await _dio.get('/cep');
    return ViaCEPsModel.fromJson(res.data);
  }

  Future<void> create(ConsultaCEPModel viaCEP) async {
    try {
      await _dio.post('/cep', data: viaCEP.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCep(ViaCEPModel cep) async {
    try {
      await _dio.delete('/cep/${cep.objectId}');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizarCep(ViaCEPModel cep) async {
    try {
      await _dio.put('/cep/${cep.objectId}', data: cep.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
