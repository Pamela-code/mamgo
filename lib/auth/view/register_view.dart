import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/logo2.png'),
            const Text('Faça Seu Cadastro'),
            const TextFieldManngo(label: 'Nome'),
            const TextFieldManngo(label: 'Email'),
            const TextFieldManngo(label: 'Senha'),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ButtonManngo(label: 'Cadastrar', onPressed: () {}),
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ButtonManngo(
                  label: 'Cancelar',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
