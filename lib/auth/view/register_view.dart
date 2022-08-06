import 'package:flutter/material.dart';
import 'package:mamgo/auth/controller/auth_controller.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final _keyForm = GlobalKey<FormState>();
  AuthController controller = AuthController();

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
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/logo2.png'),
              const Text('Faça Seu Cadastro'),
              TextFieldManngo(
                label: 'Nome',
                validator: (String? valor) {
                  if (valor == "") {
                    return "Por favor preencha esse campo";
                  }
                  return null;
                },
              ),
              TextFieldManngo(
                label: 'Email',
                validator: (String? valor) {
                  if (valor == "") {
                    return "Por favor preencha esse campo";
                  }
                  return null;
                },
              ),
              TextFieldManngo(
                label: 'Senha',
                validator: (String? valor) {
                  if (valor == "") {
                    return "Por favor preencha esse campo";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ButtonManngo(
                    label: 'Cadastrar',
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        controller.createUser();
                      }
                    }),
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
      ),
    );
  }
}
