import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

int _selectedIndex = 0;

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Account Registration"),
        backgroundColor: Colors.primaries[13],
      ),
      body: const RegistrationForm(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.primaries[13],
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ADD',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "EDIT",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'DELETE',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          onTap: (selectedIndex) {
            switch (selectedIndex) {
              case 0:
                showAlertDialog(context, "add");
                break;
              case 1:
                showAlertDialog(context, "edit");
                break;
              case 2:
                showAlertDialog(context, "delete");
                break;
              default:
                {}
                break;
            }
          } //_onItemTapped,
          ),
    );
  }
}

// Create a Form widget.
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

final fullnameController = TextEditingController();
final emailController = TextEditingController();
final mobileController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: fullnameController,
            autofocus: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter your full name',
              labelText: 'Full Name',
            ),
          ),
          TextFormField(
            controller: emailController,
            autofocus: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Enter your email address',
              labelText: 'Email Address',
            ),
          ),
          TextFormField(
            controller: mobileController,
            autofocus: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter a mobile number',
              labelText: 'Mobile No.',
            ),
          ),
          TextFormField(
            controller: usernameController,
            autofocus: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.verified_user),
              hintText: 'Enter usern name',
              labelText: 'User Name',
            ),
          ),
          TextFormField(
            obscureText: _isObscure,
            controller: passwordController,
            autofocus: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.password),
              hintText: 'Enter password',
              labelText: 'Password',
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 40.0, top: 40.0),
              child: ElevatedButton(
                onPressed: () => {
                  showAlertDialog(
                      context, "DO YOU WANT TO SAVE DATA TO THE DATABASE ?")
                },
                child: const Text('Submit'),
              )),
        ],
      ),
    );
  }
}

//SAVE DATA
// ignore: non_constant_identifier_names
SaveData(BuildContext context, fname, email, mobileno, usrname, pwd) async {
  var client = http.Client();
  try {
    final url = Uri.parse("http://localhost:5100/api/users/register");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'full_name': fname,
      'email': email,
      'mobile_no': mobileno,
      'username': usrname,
      'passwd': pwd
    };
    String jsonbody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await client.post(url,
        headers: headers, body: jsonbody, encoding: encoding);
    int statuscode = response.statusCode;
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (statuscode == 200) {
      // ignore: use_build_context_synchronously
      alertMesage(context, responseJson['message'].toString());
    } else {
      // ignore: use_build_context_synchronously
      alertMesage(context, responseJson['message'].toString());
    }
  } on Exception catch (ex) {
    alertMesage(context, ex.toString());
  } finally {
    client.close();
  }
}

//ALERT BUTTON
showAlertDialog(BuildContext context, String msg) {
  // Create AlertDialog
  var alert = CupertinoAlertDialog(
    title: const Text("CONFIRMATION MESSAGE \n"),
    content: Text(msg),
    actions: [
      CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            SaveData(
                context,
                fullnameController.text,
                emailController.text,
                mobileController.text,
                usernameController.text,
                passwordController.text);

            fullnameController.clear();
            emailController.clear();
            mobileController.clear();
            usernameController.clear();
            passwordController.clear();

            Navigator.of(context, rootNavigator: true).pop("Discard");
          },
          child: const Text('Yes')),
      CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop("Discard");
          },
          child: const Text('No')),
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

alertMesage(BuildContext context, String msg) {
  var alert = CupertinoAlertDialog(
    title: const Text("Alert Message \n"),
    content: Text(msg),
    actions: [
      CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop("Discard");
          },
          child: const Text('Ok')),
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
