import 'package:flutter/material.dart';
import 'package:mad2025/screens/login/registerDialog.dart';
import 'package:mad2025/screens/login/loginDialog.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Register"),
              onPressed: () {
                createRegisterDialog(context);
              },
            ),
            ElevatedButton(
                child: const Text("Login"),
                onPressed: (){
                  createLoginDialog(context);
                }
            )
          ],
        ),
      ),
    );
  }
}