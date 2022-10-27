import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primaries[7],
      appBar: AppBar(
        title: const Text("Contact Management"),
      ),
      body: const Center(),
    );
  }
}
