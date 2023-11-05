import 'package:flutter/material.dart';
import '../widgets/armultipletargets.dart';

class EquationPage extends StatefulWidget {
  const EquationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EquationState();
}

class _EquationState extends State<EquationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Equations"),
      ),
      body: Container(
        child: const Center(
      
          child: ArMultipleTargetsWidget()),
          )
      );
  }
}