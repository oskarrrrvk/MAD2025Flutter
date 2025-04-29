import 'package:flutter/material.dart';
import 'package:mad2025/screens/home/homePage.dart';

void createLoginDialog(BuildContext context){
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
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
                child: const Text("Submit"),
                onPressed:(){
                  if (evaluateUserName(userName.text) && evaluatePassword(userName.text, password.text)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                  else {
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Username or password are incorrect')),
                    );
                  }
                }
            )
          ],
        );
      },
  );
}

String getUserName(){
  return "";
}

String getPassword(String userName){
  return "";
}

bool evaluateUserName(String userName){
  return true;
}
bool evaluatePassword(String userName, String password){
  return true;
}