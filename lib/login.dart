import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => loginDialog(context));
    return Scaffold(
      backgroundColor: Colors.primaries[11],
      appBar: AppBar(
        title: const Text("Account Login"),
      ),
      body: const Center(),
    );
  }
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();

loginDialog(BuildContext context) {
  // Create AlertDialog
  var alert = CupertinoAlertDialog(
    title: const Text("Authentication" + "\n"),
    // content: const Text("Login"),
    content: Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: TextField(
              keyboardType: TextInputType.text,
              // style: const TextStyle(fontSize: 18, height: 1),
              controller: usernameController,
              autofocus: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "User Name",
                  filled: true,
                  fillColor: Colors.grey.shade50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: passwordController,
              autofocus: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.grey.shade50),
            ),
          ),
        ],
      ),
    ),
    actions: [
      CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            if (usernameController.text.isEmpty) {
              return;
            } else {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            }
          },
          child: const Text('login')),
      CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Text('Cancel')),
    ],
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
