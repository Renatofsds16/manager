import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager/validator/validate_fields.dart';
import 'Cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  String? _errorEmail;
  String? _errorPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(24),
                child: Image.asset(
                  'images/dollar.png',
                  width: 200,
                  height: 200,
                )),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    errorText: _errorEmail,
                    border: const OutlineInputBorder(),
                    labelText: 'Digite seu email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    errorText: _errorPassword,
                    border: const OutlineInputBorder(),
                    labelText: 'Digite sua senha'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Não ten conta? '),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cadastro()));
                    },
                    child: const Text(
                      'Cadastr-se',
                      style: TextStyle(color: Colors.amber),
                    ))
              ],
            ),
            ElevatedButton(onPressed: () {_validarCampos();}, child: const Text('Login'))
          ],
        ),
      ),
    );
  }

  _validarCampos() {
    ValidatorFields validatorEmail = ValidatorFields(_controllerEmail);
    ValidatorFields validatorPassword = ValidatorFields(_controllerPassword);
    if(validatorEmail.validatorFieldEmail()){
      _errorEmail = null;
      if(validatorPassword.validateField()){
        setState(() {
          _errorPassword = null;
        });
        //logar usuario

        //proxima tela
      }else{
        setState(() {
          _errorPassword = 'verifique a senha e tente novamente';
        });
      }
    }else{
      setState(() {
        _errorEmail = 'Email invalido! Digite novamente';
      });
    }
  }
}
