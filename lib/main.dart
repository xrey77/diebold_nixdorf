import 'dart:convert';
// import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
// import 'package:session/session.dart';
import 'aboutus.dart';
import 'services.dart';
import 'products.dart';
import 'contacts.dart';
import 'administration.dart';
import 'register.dart';

// export 'package:session/session.dart' show Result;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Diebol-Nixdorf',
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/images/admin.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Text(""),
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutusPage()),
                );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[1]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
            ListTile(
              title: const Text('Services'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServicesPage()),
                );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[2]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
            ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsPage()),
                );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[5]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
            ListTile(
              title: const Text('Contact Management'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactsPage()),
                );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[7]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
            ListTile(
              title: const Text('Administration'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdministrationPage()),
                );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[9]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push(context, loginDialog(context)
                    // MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[11]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
            ListTile(
              title: const Text('Register'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()),
                );
              },
              leading: CircleAvatar(backgroundColor: Colors.primaries[13]),
            ),
            Divider(color: Colors.grey.shade400, indent: 0, height: 1.0),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Diebold-Nixdorf'),
      ),
      // body: const Center(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class AdminDropdown extends StatelessWidget {
  const AdminDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Menu Themed Demo'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Item 1'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Item 2'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Item 3'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Item A')),
              const PopupMenuItem(child: Text('Item B')),
            ],
          ),
        ],
      ),
      body: const Center(),
    );
  }
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
const bool _isObscure = true;

loginDialog(BuildContext context) {
  // Create AlertDialog
  var alert = CupertinoAlertDialog(
    title: const Text("AUTHENTICATION" + "\n"),
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
                  icon: const Icon(Icons.person),
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
              obscureText: _isObscure,
              keyboardType: TextInputType.text,
              controller: passwordController,
              autofocus: false,
              decoration: InputDecoration(
                  icon: const Icon(Icons.password_sharp),
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
              sendLogindata(
                  context, usernameController.text, passwordController.text);
              Navigator.of(context, rootNavigator: true).pop("Discard");
              // Navigator.popUntil(context, ModalRoute.withName('/'));
            }
          },
          child: const Text('login')),
      CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop("Discard");
            // Navigator.popUntil(context, ModalRoute.withName('/'));
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

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

sendLogindata(BuildContext context, String usr, String pwd) async {
  var client = http.Client();
  try {
    final url = Uri.parse("http://localhost:5100/api/users/login");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'username': usr,
      'passwd': pwd,
    };
    String jsonbody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await client.post(url,
        headers: headers, body: jsonbody, encoding: encoding);
    int statuscode = response.statusCode;
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (statuscode == 200) {
      // var session = FlutterSession();
      // await session.set("ID", responseJson['userid']);
      // await FlutterSession().set("FULLNAME", responseJson['full_name']);
      // await FlutterSession().set("USERNAME", responseJson['username']);
      // await FlutterSession().set("EMAIL", responseJson['email']);
      // await FlutterSession().set("MOBILENO", responseJson['mobile_no']);
      // await FlutterSession().set("TOKEN", responseJson['token']);
      // ignore: use_build_context_synchronously
      alertMesage(context, "You have successfully logged-in to your account.");
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
