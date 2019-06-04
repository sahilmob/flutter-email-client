import "package:flutter/material.dart";

import "./Provider.dart";
import './ContactManager.dart';
import "./App.dart";

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.red),
        home: App(),
      ),
    );
  }
}
