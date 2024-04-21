import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manager/pages/Home.dart';
import 'Cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  String? errorEmail;
  String? errorSenha;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                errorText: errorSenha,
                border: const OutlineInputBorder(),
                labelText: 'Digite seu email'
            
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: controllerSenha,
              decoration: InputDecoration(
                errorText: errorSenha,
                  border: const OutlineInputBorder(),
                  labelText: 'Digite sua senha'

              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Não ten conta? '),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                    MaterialPageRoute(
                        builder: (context)=> Cadastro()
                    )
                  );
                },
                  child: const Text('Cadastr-se',
                    style: TextStyle(color: Colors.amber),
                  )
              )

            ],
          ),
          ElevatedButton(onPressed: loginUsuario, child: Text('Login'))
        ],
      ),
    );
  }
  loginUsuario()async {
    if(controllerEmail.text.isEmpty){
      setState(() {
        errorEmail = 'Por favor digite seu Email';
      });
      if(controllerSenha.text.isEmpty){
        setState(() {
          errorSenha = 'Por favor digite sua senha';
        });
      }else{
        setState(() {
          errorSenha = null;
        });
      }
    }else{
      setState(() {
        errorEmail = null;
      });
      print('Seu email e ${controllerEmail.text}');
    }
  }
}
