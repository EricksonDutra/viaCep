import 'package:app_cep/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});

  final _cepController = TextEditingController();
  final _ruaController = TextEditingController();
  final _bairroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextField(
            hintText: 'Cep',
            fieldController: _cepController,
            onChange: (String) => print(_cepController.text),
          ),
          CustomTextField(hintText: 'Rua', fieldController: _ruaController),
          CustomTextField(hintText: 'Bairro', fieldController: _bairroController),
        ],
      ),
    );
  }
}
