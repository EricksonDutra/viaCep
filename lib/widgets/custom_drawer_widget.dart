import 'package:app_cep/pages/consulta_cep_page.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black26,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.add_business),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Consultar CEP'),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const ConsultaCepPage(),
            ),
          );
        },
      ),
    );
  }
}
