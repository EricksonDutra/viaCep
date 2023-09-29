import 'package:app_cep/models/consulta_cep_model.dart';
import 'package:app_cep/models/via_cep_model.dart';
import 'package:app_cep/repositories/via_cep_dio_repository.dart';
import 'package:app_cep/repositories/via_cep_repository.dart';
import 'package:app_cep/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  bool loading = false;

  var cepController = TextEditingController(text: "");

  var consultaCepModel = ConsultaCEPModel();
  var consultaCEPRepository = ConsultaCepRepository();
  var viaCepDioRepository = ViaCepDioRepository();
  var listaCep = <ViaCEPsModel>[];

  @override
  void initState() {
    cepController.text = "";
    super.initState();
  }

  salvarCEP() async {
    await viaCepDioRepository.create(
      ConsultaCEPModel(
        localidade: consultaCepModel.localidade,
        uf: consultaCepModel.uf,
        logradouro: consultaCepModel.logradouro,
        bairro: consultaCepModel.bairro,
        cep: consultaCepModel.cep,
        complemento: consultaCepModel.complemento,
        ddd: consultaCepModel.ddd,
        gia: consultaCepModel.gia,
        ibge: consultaCepModel.ibge,
        siafi: consultaCepModel.siafi,
      ),
    );
  }

  _onConsultaCep(String value) async {
    var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cep.length == 8) {
      setState(() {
        loading = true;
      });
      consultaCepModel = await consultaCEPRepository.consultarCEP(cep);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP'),
        actions: [
          IconButton(
            onPressed: () {
              cepController.clear();
              consultaCepModel.logradouro = '';
              consultaCepModel.localidade = '';
              consultaCepModel.uf = '';
              setState(() {});
            },
            icon: const FaIcon(FontAwesomeIcons.broomBall),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Insira o CEP que deseja consultar: ",
              style: TextStyle(fontSize: 22),
            ),
            CustomTextField(hintText: 'CEP', fieldController: cepController, onChange: _onConsultaCep),
            const SizedBox(
              height: 50,
            ),
            Text(
              consultaCepModel.logradouro ?? "",
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              "${consultaCepModel.localidade ?? ""} - ${consultaCepModel.uf ?? ""}",
              style: const TextStyle(fontSize: 22),
            ),
            TextButton(
                onPressed: () {
                  salvarCEP();
                  consultaCepModel.logradouro = '';
                  consultaCepModel.localidade = '';
                  consultaCepModel.uf = '';
                  Navigator.pop(context);
                },
                child: const Text('Salvar')),
            if (loading) const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
