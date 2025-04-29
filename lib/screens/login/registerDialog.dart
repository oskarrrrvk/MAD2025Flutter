import 'package:flutter/material.dart';
import 'package:mad2025/screens/home/homePage.dart';

void createRegisterDialog(BuildContext context){
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: const Text("LOGIN"),
        content: Column(
          children: [
            TextField(
              controller: userName,
              decoration: const InputDecoration(labelText: "username"),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "password"),
            )
          ],
        ),
        actions: [
          ElevatedButton(
            child: const Text("Cancell"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
              child: const Text("Submit"),
              onPressed:(){
                saveUser(userName.text, password.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
          )
        ],
      );
    },
  );
}

void saveUser(String userName, String password){

}