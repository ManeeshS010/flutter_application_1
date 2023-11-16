import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
        body: SafeArea(
          
          child:  Calculatorview(),
        ),
      );
  }
}