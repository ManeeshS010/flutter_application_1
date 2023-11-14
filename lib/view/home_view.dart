import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(color: Colors.red,
        child: const Center(child: Text("Hello World",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight:FontWeight.bold,
          fontSize: 40
        
        ),)),),
      );
  }
}