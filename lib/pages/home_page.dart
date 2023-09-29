import 'package:app_cep/models/via_cep_model.dart';
import 'package:app_cep/repositories/via_cep_dio_repository.dart';
import 'package:app_cep/widgets/custom_bottom_sheet.dart';
import 'package:app_cep/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cepRepo = ViaCepDioRepository();
  var _cepsBack4App = ViaCEPsModel([]);
  var cep;

  @override
  void initState() {
    super.initState();
    _getCep();
  }

  void _getCep() async {
    _cepsBack4App = await _cepRepo.consultarCEP();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CEPs armazenados'),
          actions: [IconButton(onPressed: _getCep, icon: const FaIcon(FontAwesomeIcons.arrowRotateRight))],
        ),
        drawer: const CustomDrawerWidget(),
        body: Column(
          children: [
            _cepsBack4App.results.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _cepsBack4App.results.length,
                      itemBuilder: (BuildContext bc, int idx) {
                        var cep = _cepsBack4App.results[idx];
                        return Dismissible(
                          key: Key(cep.cep),
                          onDismissed: ((direction) {
                            _cepRepo.removeCep(cep);
                          }),
                          child: ListTile(
                            title: Text('${cep.logradouro} - ${cep.bairro}'),
                            subtitle: Text('${cep.localidade} - ${cep.uf} '),
                            trailing: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.penToSquare),
                              color: Colors.green,
                              onPressed: () =>
                                  showModalBottomSheet(context: context, builder: (bc) => CustomBottomSheet()),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: FaIcon(
                            size: 100,
                            color: Colors.blueGrey,
                            FontAwesomeIcons.streetView,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Não há CEPs cadastrados",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
