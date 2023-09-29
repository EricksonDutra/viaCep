import 'package:app_cep/models/via_cep_model.dart';
import 'package:app_cep/repositories/via_cep_dio_repository.dart';
import 'package:app_cep/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  // final _cepController = TextEditingController();
  final _ruaController = TextEditingController();
  final _bairroController = TextEditingController();
  final viaCepDioRepository = ViaCepDioRepository();

  _atualizar() async {
    final viaCEP = ViaCEPModel.criar(
      logradouro: _ruaController.text,
      bairro: _bairroController.text,
    );

    await viaCepDioRepository.atualizarCep(viaCEP);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CustomTextField(
          //   hintText: 'Cep',
          //   fieldController: _cepController,
          // ),
          CustomTextField(hintText: 'Rua', fieldController: _ruaController),
          CustomTextField(hintText: 'Bairro', fieldController: _bairroController),
          ElevatedButton(
              onPressed: () async {
                await _atualizar();
              },
              child: const Text("Salvar"))
        ],
      ),
    );
  }
}
