import 'package:flutter/material.dart';

class AdministrationPage extends StatelessWidget {
  const AdministrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primaries[9],
      appBar: AppBar(
        title: const Text("Administration"),
      ),
      body: const Center(),
    );
  }
}
