import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primaries[2],
      appBar: AppBar(
        title: const Text("Services"),
      ),
      body: const Center(),
    );
  }
}
