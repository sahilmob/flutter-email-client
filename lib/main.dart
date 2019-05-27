import "package:flutter/material.dart";

import "./MessageList.dart";
import "./App.dart";

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: App(),
    );
  }
}
