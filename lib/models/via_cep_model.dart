class ViaCEPsModel {
  List<ViaCEPModel> results = [];

  ViaCEPsModel(this.results);

  ViaCEPsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ViaCEPModel>[];
      json['results'].forEach((v) {
        results.add(ViaCEPModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class ViaCEPModel {
  String objectId = "";
  String? cep = "";
  String logradouro = "";
  String? complemento = "";
  String? localidade = "";
  String? uf = "";
  String? ibge = "";
  String bairro = "";
  String? createdAt = "";
  String? updatedAt = "";

  // ViaCEPModel(cep, logradouro, bairro, complemento, localidade, uf, ibge, createdAt, updatedAt);
  // ViaCEPModel.criar(this.logradouro, this.localidade);
  ViaCEPModel({
    this.cep,
    required this.logradouro,
    required this.bairro,
    this.complemento,
    this.localidade,
    this.uf,
    this.ibge,
    this.createdAt,
    this.updatedAt,
  });
  ViaCEPModel.criar({
    required this.logradouro,
    required this.bairro,
  });

  ViaCEPModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    complemento = json['complemento'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['complemento'] = complemento;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
