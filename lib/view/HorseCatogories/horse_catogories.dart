import 'package:flutter/material.dart';

class HoreseCatagories extends StatefulWidget {
  const HoreseCatagories({super.key});

  @override
  State<HoreseCatagories> createState() => _HoreseCatagoriesState();
}

class _HoreseCatagoriesState extends State<HoreseCatagories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hores Catagories"),
        ],
      ),
    );
  }
}
