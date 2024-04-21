import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController controllerNomeCadastro = TextEditingController();
  TextEditingController controllerEmailCadastro = TextEditingController();
  TextEditingController controllerSenhaCadastro = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Cadastro'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controllerNomeCadastro,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu nome'

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controllerEmailCadastro,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu email'

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: controllerSenhaCadastro,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite sua senha'

              ),
            ),
          ),

        ],
      ),
    );
  }
}
