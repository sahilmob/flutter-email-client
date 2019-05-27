import 'package:flutter/material.dart';
import "./AppDrawer.dart";

class CalenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calender"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Calender screen"),
      ),
    );
  }
}
