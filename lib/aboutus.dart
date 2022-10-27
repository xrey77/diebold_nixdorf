import 'package:flutter/material.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primaries[1],
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const Center(),
    );
  }
}
