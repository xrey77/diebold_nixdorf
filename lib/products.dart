import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primaries[5],
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: const Center(),
    );
  }
}
