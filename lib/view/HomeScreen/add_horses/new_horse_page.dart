import 'package:flutter/material.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
class CreateNewHorse extends StatefulWidget {
  const CreateNewHorse({super.key});
  @override
  State<CreateNewHorse> createState() => _CreateNewHorseState();
}

class _CreateNewHorseState extends State<CreateNewHorse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Add new horses")
        ],
      ),
    );
  }
}
